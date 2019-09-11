class Student < ApplicationRecord
  belongs_to :section, -> (s){ where (s.year=self.year) }, class_name: 'Section' #, ->{ includes :department } , -> { readonly }
  has_one :department, through: :section
  has_and_belongs_to_many :subjects
  has_many :teachers, through: :section
  has_many :assignments, as: :assigned
end
