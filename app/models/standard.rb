class Standard < ActiveRecord::Base
  has_many :students
  has_many :subjects
  has_many :subject_combinations
  has_many :marks
  # belongs_to :subject_combination_datails
  attr_accessible :name, :current
  validates :name, presence: true
end
