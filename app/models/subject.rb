class Subject < ActiveRecord::Base
  belongs_to :standard
  
  has_many :marks
  has_many :students, through: :marks

  has_many :subject_combination_details
  has_many :subject_combinations, through: :subject_combination_details
  
  attr_accessible :name, :standard_id, :full_mark, :pass_mark, :practical, :practical_full_mark, :practical_pass_mark, :current, :grades
  validates :name, presence: true
  # validates :full_mark, presence: true
  # validates :pass_mark, presence: true
  validates :standard_id, presence: true
end
