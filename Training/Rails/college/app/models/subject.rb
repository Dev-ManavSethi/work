class Subject < ApplicationRecord
  #associations
  belongs_to :department
  has_and_belongs_to_many :teachers
  has_and_belongs_to_many :students
  has_many :sections, through :department
  #validations
end
