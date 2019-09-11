class Section < ApplicationRecord
  belongs_to :department
  has_and_belongs_to_many :teachers
  has_one :co_ordinator, class_name: 'Teacher', foreign_key: :id
  has_many :subjects, through: :department
  has_many :students

  validates :department_id,:name, presence: true
  validates :name, format: {with: /[A-Z][A-Z]-2K\d\d/, message:"Wrong section name pattern"}, length:{is:7, wrong_length:"Wrong length of section id, correct: 7"}
end
