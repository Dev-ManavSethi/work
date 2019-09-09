class Teacher < ApplicationRecord
  #associations
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :sections
  has_and_belongs_to_many :students
  has_many :departments, through :subjects
  has_many :departments, through :sections
  #validations
  validates :id, :name, :dob, :exp, presence:true
  validates :id, format: {with: /[TCHR]-\w/, message: "Expression: [A-Z][A-Z]-\w"}
  validates :name, length:{maximun:30, minimum:2, too_long:"Name exceeds 30 chars", too_short:"Name less than 30 chars"}
  validates :dob, format:{with: /\d{4}-\d{2}-\d{2}/, message:"Invalid date pattern, required: yyyy-mm-dd"}, length:{is:10}
  validates :exp , numericality:{only_integer: true, greater_than_or_equal_to:0}
end
