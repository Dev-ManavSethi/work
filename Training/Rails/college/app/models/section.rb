class Section < ApplicationRecord
  #associations
  belongs_to :department
  has_and_belongs_to_many :teachers
  has_many :students
  has_many :subjects, through :department
  #validations
  validates :id, :departments_id, presence: true
  validates :id, format: {with: /[A-Z][A-Z]-2K\d\d/, message:"Wrong section id pattern"}, length:{is:7, wrong_length:"Wrong length of section id, correct: 7"}
end
