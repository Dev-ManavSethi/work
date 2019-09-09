class Section < ApplicationRecord
  validates :id, :departments_id, presence: true
  validates :id, format: {with: /[A-Z][A-Z]-2K\d\d/, message:"Wrong section id pattern"}, length:{is:7, wrong_length:"Wrong length of section id, correct: 7"}
end
