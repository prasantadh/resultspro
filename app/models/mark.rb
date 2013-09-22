class Mark < ActiveRecord::Base
  belongs_to :exam
  belongs_to :student
  belongs_to :subject
  belongs_to :standard
  attr_accessible :exam_id, :th_mark, :pr_mark, :student_id, :subject_id, :standard_id, :grade
  validates :exam_id, presence: true
  validates :student_id, presence: true
  validates :subject_id, presence: true
end


