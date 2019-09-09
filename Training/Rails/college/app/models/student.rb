class Student < ApplicationRecord
  #associations
  belongs_to :section
  has_and_belongs_to_many :teachers
  has_and_belongs_to_many :subjects
  has_one :department, through :section
  #validations

end
