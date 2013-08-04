class Exam < ActiveRecord::Base
  attr_accessible :name
  has_many :marks
  validates :name, presence: true, uniqueness: true
end
