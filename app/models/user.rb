class User < ActiveRecord::Base




  validates_uniqueness_of :username, :scope => [:is_deleted], :if => 'is_deleted == false'
  validates_length_of     :username, :within => 1..20
  validates_length_of     :password, :within => 4..40, :allow_nil => true
  validates_format_of     :username, :with => /\A[A-Z0-9_-]*\z/i,
    :message => "must_contain_only_letters"
  validates_format_of     :email, :with => /\A[A-Z0-9._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}\z/i, :allow_blank => true,
    :message => "must_be_a_valid_email_address"



  validates :role, :presence => {:on => :create}
  validates :password, :presence => {:on => :create}

  has_and_belongs_to_many :privileges
  has_many  :user_events
  has_many  :events, :through => :user_events
  has_one :student_record,  :class_name => 'Student',  :foreign_key => 'user_id'
  has_one :employee_record, :class_name => 'Employee', :foreign_key => 'user_id'

	scope :active, -> { where is_deleted: false}
	scope :inactive, -> { where is_deleted: true}

  def full_name
    "#{first_name} #{last_name}"
  end

  
  def before_save
    self.salt = random_string(8) if self.salt.blank?
    self.hashed_password = Digest::SHA1.hexdigest(self.salt + self.password) if self.password.present?
    if self.new_record?
      self.admin    = self.role == 'Admin'
      self.student  = self.role == 'Student'
      self.employee = self.role == 'Employee'
      self.parent   = self.role == 'Parent'
      self.is_first_login = true
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def check_reminders
    Reminder.where(:recipient => self.id, :is_read => true).length
  end

  def self.authenticate?(username, password)
    u = User.find_by_username(username)
    u.hashed_password == Digest::SHA1.hexdigest(u.salt + password)
  end

  def random_string(len)
    randstr = ""
    chars = ("0".."9").to_a + ("a".."z").to_a + ("A".."Z").to_a
    len.times { randstr << chars[rand(chars.size - 1)] }
    randstr
  end

  def role_name
    return "Admin"    if self.admin?
    return "Student"  if self.student?
    return "Employee" if self.employee?
    return "Parent"   if self.parent?
  end

  def role_symbols
    prv = []
    @privilge_symbols ||= privileges.map { |privilege| prv << privilege.name.underscore.to_sym }

    if admin?
      return [:admin] + prv
    elsif student?
      return [:student] + prv
    elsif employee?
      employee = employee_record
      unless employee.nil?
        if employee.subjects.present?
          prv << :subject_attendance if Configuration.get_config_value('StudentAttendanceType') == 'SubjectWise'
          prv << :subject_exam
        end
        if Batch.active.collect(&:employee_id).include?(employee.id.to_s)
          prv << :view_results
        end
      end
      return [:employee] + prv
    elsif parent?
      return [:parent] + prv
    else
      return prv
    end
  end

  def clear_menu_cache
    Rails.cache.delete("user_main_menu#{self.id}")
    Rails.cache.delete("user_autocomplete_menu#{self.id}")
  end

  def parent_record
    Student.find_by_admission_no(self.username[1..self.username.length])
  end

  def has_subject_in_batch(b)
    employee_record.subjects.collect(&:batch_id).include?(b.id)
  end

  def days_events(date)
    all_events = []
    case(role_name)
    when 'Admin'
      all_events = Event.find(:all, :conditions => ['? BETWEEN DATE(events.start_date) AND DATE(events.end_date)', date])
    when 'Student'
      all_events += events.all(:conditions => ['? BETWEEN DATE(events.start_date) AND DATE(events.end_date)', date])
      all_events += student_record.batch.events.all(:conditions => ['? BETWEEN DATE(events.start_date) AND DATE(events.end_date)', date])
      all_events += Event.all(:conditions => ['(? BETWEEN DATE(events.start_date) AND DATE(events.end_date)) AND is_common = ?', date, true])
    when 'Parent'
      all_events += events.all(:conditions => ['? BETWEEN DATE(events.start_date) AND DATE(events.end_date)', date])
      all_events += parent_record.user.events.all(:conditions => ['? BETWEEN DATE(events.start_date) AND DATE(events.end_date)', date])
      all_events += parent_record.batch.events.all(:conditions => ['? BETWEEN DATE(events.start_date) AND DATE(events.end_date)', date])
      all_events += Event.all(:conditions => ['(? BETWEEN DATE(events.start_date) AND DATE(events.end_date)) AND is_common = ?', date, true])
    when 'Employee'
      all_events += events.all(:conditions => ['? BETWEEN events.start_date AND events.end_date', date])
      all_events += employee_record.employee_department.events.all(:conditions => ['? BETWEEN DATE(events.start_date) AND DATE(events.end_date)', date])
      all_events += Event.all(:conditions => ['(? BETWEEN DATE(events.start_date) AND DATE(events.end_date)) AND is_exam = ?', date, true])
      all_events += Event.all(:conditions => ['(? BETWEEN DATE(events.start_date) AND DATE(events.end_date)) AND is_common = ?', date, true])
    end
    all_events
  end

  def next_event(date)
    all_events=[]
    case(role_name)
    when 'Admin'
      all_events = Event.find(:all,:conditions => ['? < DATE(events.end_date)', date], :order => 'start_date')
    when 'Student'
      all_events += events.all(:conditions => ['? < DATE(events.end_date)', date])
      all_events += student_record.batch.events.all(:conditions => ['? < DATE(events.end_date)', date], :order => 'start_date')
      all_events += Event.all(:conditions => ['(? < DATE(events.end_date)) AND is_common = ?', date, true], :order => 'start_date')
    when 'Parent'
      all_events += events.all(:conditions => ['? < DATE(events.end_date)', date])
      all_events += parent_record.user.events.all(:conditions => ['? < DATE(events.end_date)', date])
      all_events += parent_record.batch.events.all(:conditions => ['? < DATE(events.end_date)', date], :order => 'start_date')
      all_events += Event.all(:conditions => ['(? < DATE(events.end_date)) AND is_common = ?', date, true], :order => 'start_date')
    when 'Employee'
      all_events += events.all(:conditions => ['? < DATE(events.end_date)', date], :order => 'start_date')
      all_events += employee_record.employee_department.events.all(:conditions => ['? < DATE(events.end_date)', date], :order => 'start_date')
      all_events += Event.all(:conditions => ['(? < DATE(events.end_date)) AND is_exam = ?', date, true], :order => 'start_date')
      all_events += Event.all(:conditions => ['(? < DATE(events.end_date)) AND is_common = ?', date, true], :order => 'start_date')
    end
    start_date = all_events.collect(&:start_date).min
    unless start_date
      return ''
    else
      next_date = (start_date.to_date <= date ? date + 1.days : start_date )
      next_date
    end
  end

  def soft_delete
    self.update_attributes(:is_deleted => true)
  end

end
