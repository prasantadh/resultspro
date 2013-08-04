class Student < ActiveRecord::Base
  belongs_to :standard
  belongs_to :subject_combination
  has_many :marks
  has_many :subjects, through: :marks
  attr_accessible :standard_id, :subject_combination_id, :name, :roll, :current
  validates :subject_combination_id, presence: true
  validates :name, presence: true
  validates :roll, presence: true
  
end
