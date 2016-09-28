class Attendance < ActiveRecord::Base
  belongs_to :student
  scope  :by_month, lambda { |d| { :conditions => { :month_date => d.beginning_of_month..d.end_of_month } } }
  scope  :by_month_and_batch, lambda { |d, b| { :conditions => { :month_date => d.beginning_of_month..d.end_of_month, :batch_id => b } } }
end
