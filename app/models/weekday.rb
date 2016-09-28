class Weekday < ActiveRecord::Base

  WEEKDAYS = {
    '0' => I18n.t('sunday'),
    '1' => I18n.t('monday'),
    '2' => I18n.t('tuesday'),
    '3' => I18n.t('wednesday'),
    '4' => I18n.t('thursday'),
    '5' => I18n.t('friday'),
    '6' => I18n.t('saturday')
  }

  belongs_to :batch
  has_many :timetable_entries, :dependent => :destroy

  default_scope { order('weekday ASC') } 

  scope :default, -> { where :batch_id => nil, is_deleted: false}
 # scope :for_batch, -> { where :batch_id => nil, is_deleted: false}
  
 # named_scope   :for_batch, lambda { |b| { :conditions => { :batch_id => b, :is_deleted => false } } }

  def self.weekday_by_day(batch_id)
    weekdays = Weekday.where(batch_id: batch_id)
    weekdays = Weekday.default if weekdays.empty?

    weekdays.group_by(&:day_of_week)
  end

  def deactivate
    self.update_attribute(:is_deleted, true)
  end

  def self.add_day(batch_id, day)
    batch_id = nil if batch_id == 0

    if weekday = Weekday.find_by_batch_id_and_day_of_week(batch_id, day)
      weekday.update_attributes(:is_deleted => false, :day_of_week => day)
    else
      Weekday.create(:day_of_week => day, :weekday => day, :batch_id => batch_id, :is_deleted => false)
    end
  end
end
