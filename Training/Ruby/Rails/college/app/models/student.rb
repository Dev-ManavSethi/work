class Student < ApplicationRecord
  belongs_to :section
  validates :name, presence :true
  validates :section_id, presence :true
end
