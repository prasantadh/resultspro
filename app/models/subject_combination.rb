class SubjectCombination < ActiveRecord::Base
  attr_accessible :name, :standard_id

  has_many :subject_combination_details
  has_many :subjects, through: :subject_combination_details
  
  belongs_to :standard
  
  validates :name, presence: true
  validates :standard_id, presence: true
end

