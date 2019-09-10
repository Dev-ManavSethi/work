class Department < ApplicationRecord
  #associations
  has_many :sections
  has_many :subjects through :sections
  has_many :teachers, through :sections
  has_many :students, through :sections
  has_one :hod, class_name: "Teacher", foreign_key: 'teacher_id'
  #validations
  validates :name, :id, :isAcademic, presence: true, confirmation: {accept: true, message: "Doesn't match confirmation"}
  validates :isAcademic, acceptance: {accept: [true, "t",true, "yes", "y","1", 1,0, "0","n" "no", "false", "f", false], message: "Enter valid value", case_sensetive: false}
  validates :id, inclusion: {in: %w(CE IT ME ECE ELE EICE HUM COE TPO LIB EST SWD MD), message: "Must be CE, IT, ME, ECE ELE or EIC"}, length: {maximum: 6, minimun: 2 ,too_long: "Max id length is 6", too_short: "Minimum id length is 2"}, uniqueness: true
  validates :name, uniqueness:true, length: {maximum: 30, minimun:6, too_long:"Maximum department name length is 30", too_short: "Minimum department name length is 6"}
end
