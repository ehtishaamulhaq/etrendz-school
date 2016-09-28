class Event < ActiveRecord::Base
  validates_presence_of :title, :description, :start_date, :end_date
  validate :valid_date

    scope :holidays, -> { where :is_holiday => true}
    scope :exams, -> { where :is_exam => true}

  has_many :batch_events, :dependent => :destroy
  has_many :employee_department_events, :dependent => :destroy
  has_many :user_events, :dependent => :destroy
  belongs_to :origin , :polymorphic => true

  def student_event?(student)
    fiance_fee_collection_event?(student) || user_event?(student)
  end

  def employee_event?(user)
    !!user_events && user_events.map{|x|x.user_id }.include?(user.id)
  end

  def active_event?
    !!(origin.nil? || (origin && origin.respond_to?('is_deleted') && !origin.is_deleted))
  end

  def dates
    (start_date.to_date..end_date.to_date).to_a
  end

  class << self
    def a_holiday?(day)
      Event.holidays.find(:all, :conditions => ["start_date <= ? AND end_date >= ?", day.beginning_of_day, day.end_of_day]).any?
    end
  end

  private

    def valid_date
      errors.add(:end_time, "#{t('can_not_be_before_the_start_time')}") if start_date && end_date && end_date < start_date
    end

    def fiance_fee_collection_event?(student)
      if origin && origin.respond_to?('batch_id') && origin.batch_id == student.batch_id
        !!origin.fee_table && origin.fee_table.map{|fee|fee.student_id}.include?(student.id)
      end
    end

    def user_event?(student)
      !!user_events && user_events.map{ |x|x.user_id }.include?(student.user.id)
    end

end