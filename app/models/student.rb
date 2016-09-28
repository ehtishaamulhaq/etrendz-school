class Student < ActiveRecord::Base
  belongs_to :batch

  belongs_to :user
  has_many   :batch_students
  has_many   :attendances

  belongs_to :country
  belongs_to :student_category
  belongs_to :nationality, :class_name => 'Country'

  scope :active, -> { where is_active: true }
  scope :by_first_name, -> { order 'first_name' }
  # scope :with_full_name_only, :select => "id, CONCAT_WS('', first_name, ' ', last_name) AS name, first_name, last_name", :order => :first_name
  # scope :with_full_name_only, -> { order 'first_name' }


 # scope :name, -> (name) { 'where("first_name like ?", "%#{name}%")' }
 # scope :admission_no, -> (admission_no) { "where(admission_no like ?", "%#{admission_no}%)" }
#  scope :batch_id, -> (batch_id) { where batch_id: batch_id }

  def first_and_last_name
    "#{first_name} #{last_name}"
  end

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def gender_as_text
    case gender.downcase
      when 'm' then 'Male'
      when 'f' then 'Female'
      else nil
    end
  end

  def graduated_batches
    self.batch_students.map{|bt| bt.batch}
  end

  def all_batches
    self.graduated_batches + self.batch.to_a
  end

  def immediate_contact
    Guardian.find(self.immediate_contact_id) unless self.immediate_contact_id.nil?
  end

  def image_file=(input_data)
    return if input_data.blank?
    self.photo_filename     = input_data.original_filename
    self.photo_content_type = input_data.content_type.chomp
    self.photo_data         = input_data.read
  end

  def next_student
    next_st = self.batch.students.where("id > #{self.id}").order("id ASC").first
    next_st ||= batch.students.order("id ASC").first
  end

  def previous_student
    prev_st = self.batch.students.where("id < #{self.id}").order("admission_no DESC").first
    prev_st ||= batch.students.order("id DESC").first
    prev_st ||= self.batch.students.order('id, DESC').first
  end

  def previous_fee_student(date)
    fee = FinanceFee.where("student_id < ? and fee_collection_id = ?", self.id, date).
      joins(:student).order("student_id DESC").first

    prev_st = fee.student unless fee.blank?

    fee ||= FinanceFee.where(fee_collection_id: date).joins(:student).order("student_id DESC").first
    prev_st ||= fee.student unless fee.blank?
    #    prev_st ||= self.batch.students.first(:order => "id DESC")
  end

  def next_fee_student(date)

    fee = FinanceFee.where("student_id > #{self.id} and fee_collection_id = #{date}").joins(:student).order("student_id ASC").first
    next_st = fee.student unless fee.nil?
    fee ||= FinanceFee.where(fee_collection_id: date).joins(:student).order("student_id ASC").first
    next_st ||= fee.student unless fee.nil?
    #    prev_st ||= self.batch.students.first(:order => "id DESC")
  end

  def finance_fee_by_date(date)
    FinanceFee.where(fee_collection_id: date.id, student_id: self.id).first
  end

  def check_fees_paid(date)
    particulars = date.fees_particulars(self)
    total_fees=0
    financefee = date.fee_transactions(self.id)
    batch_discounts = BatchFeeCollectionDiscount.where(finance_fee_collection_id: date.id)
    student_discounts = StudentFeeCollectionDiscount.where(finance_fee_collection_id: date.id, receiver_id: self.id)
    category_discounts = StudentCategoryFeeCollectionDiscount.where(finance_fee_collection_id: date.id, receiver_id: self.student_category_id)
    total_discount = 0
    total_discount += batch_discounts.map{|s| s.discount}.sum unless batch_discounts.nil?
    total_discount += student_discounts.map{|s| s.discount}.sum unless student_discounts.nil?
    total_discount += category_discounts.map{|s| s.discount}.sum unless category_discounts.nil?
    if total_discount > 100
      total_discount = 100
    end
    particulars.map { |s|  total_fees += s.amount.to_f}
    total_fees -= total_fees*(total_discount/100)
    paid_fees_transactions = FinanceTransaction.where("FIND_IN_SET(id,\"#{financefee.transaction_id}\")").select('amount,fine_amount') unless financefee.nil?
    paid_fees = 0
    paid_fees_transactions.map { |m| paid_fees += (m.amount.to_f - m.fine_amount.to_f) } unless paid_fees_transactions.nil?
    amount_pending = total_fees.to_f - paid_fees.to_f
    if amount_pending == 0
      return true
    else
      return false
    end

  end

end
