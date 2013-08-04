class SubjectCombinationDetail < ActiveRecord::Base
  attr_accessible :standard_id, :subject_combination_id, :subject_id
  
  belongs_to :subject_combination
  belongs_to :standard
  belongs_to :subject
  
  validates :standard_id, presence: true
  validates :subject_id, presence: true
  validates :subject_combination_id, presence: true
end
