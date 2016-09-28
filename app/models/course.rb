class Course < ActiveRecord::Base
  has_many :batches
  has_many :batch_groups
  has_many :ranking_levels
  has_many :class_designations
  has_many :subject_amounts

	scope :active, -> { where is_deleted: false}
	scope :deleted, -> { where is_deleted: true}


  GRADINGTYPES = { '1' => 'GPA', '2' => 'CWA', '3' => 'CCE' }
  INVERT_GRADINGTYPES = GRADINGTYPES.invert

  validates :course_name, presence: true
  validates :code, presence: true
  # validates :presence_of_initial_batch, on: :create

  def inactivate
    update_attribute(:is_deleted, true)
  end

  def full_name
    "#{course_name} #{section_name}"
  end

  def active_batches
    self.batches.where(:is_active => true, :is_deleted => false)
  end

  def inactivate
    update_attribute(:is_deleted, true)
  end

  def full_name
    "#{course_name} #{section_name}"
  end

  def active_batches
    self.batches.where(:is_active => true, :is_deleted => false)
  end

  def has_batch_groups_with_active_batches
    batch_groups = self.batch_groups
    if batch_groups.empty?
      return false
    else
      batch_groups.each do|b|
        return true if b.has_active_batches?
      end
    end
    return false
  end

  def find_course_rank(batch_ids, sort_order)
    batches   = Batch.find(batch_ids)
    @students = Student.where(batch_id: batches)
    ordered_scores  = []
    student_scores  = []
    ranked_students = []

    @students.each do |student|
      score = GroupedExamReport.find_by_student_id_and_batch_id_and_score_type(student.id, student.batch_id, 'c')
      marks = 0
      marks = score.marks if score.present?
      ordered_scores << marks
      student_scores << [student.id, marks]
    end

    ordered_scores = ordered_scores.compact.uniq.sort.reverse

    @students.each do |student|
      m = 0
      student_scores.each do |student_score|
        if student_score[0] == student.id
          m = student_score[1]
        end
      end
      if sort_order == '' || sort_order == 'rank-ascend' || sort_order == 'rank-descend'
        ranked_students << [(ordered_scores.index(m) + 1), m.to_f, student.id, student]
      else
        ranked_students << [student.full_name, (ordered_scores.index(m) + 1), m.to_f, student.id, student]
      end
    end

    if sort_order == '' || sort_order == 'rank-ascend'
      ranked_students = ranked_students.sort
    else
      ranked_students = ranked_students.sort.reverse
    end
  end

  def cce_enabled?
    Setting.cce_enabled? && grading_type == INVERT_GRADINGTYPES['CCE']
  end

  def gpa_enabled?
    Setting.has_gpa? && grading_type == INVERT_GRADINGTYPES['GPA']
  end

  def cwa_enabled?
    Setting.has_cwa? && grading_type == INVERT_GRADINGTYPES['CWA']
  end

  def normal_enabled?
    self.grading_type.nil? || self.grading_type == '0'
  end

  def self.grading_types
    hsh = {}
    hsh["0"] = "Normal"
    types = Setting.get_grading_types
    types.each { |t| hsh[t] = GRADINGTYPES[t] }
    hsh
  end

  def self.grading_types_as_options
    grading_types.invert.sort_by { |k, v| v }
  end

  def cce_weightages_for_exam_category(cce_exam_cateogry_id)
    cce_weightages.all(:conditions => { :cce_exam_category_id => cce_exam_cateogry_id })
  end

  private

  def presence_of_initial_batch
    errors.add_to_base "#{t('should_have_an_initial_batch')}" if batches.length == 0
  end

  def cce_weightage_valid

    cce_weightages.group_by(&:criteria_type).values.each do |v|
      if v.collect(&:cce_exam_category_id).count != v.collect(&:cce_exam_category_id).uniq.count
        errors.add(:cce_weightages, "can't assign more than one FA or SA under a single exam category.")
      end
    end
  end

end
