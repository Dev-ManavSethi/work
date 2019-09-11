require_relative 'member_functions'
class Department < ApplicationRecord

  #attributes: id, name, hod_id

  #associations
  has_many :sections
  has_one :hod, class_name: 'Teacher', foreign_key: :id
  has_many :subjects
  has_many :students, through: :sections

  #validations
  validates :name, presence: true, confirmation: {accept: true, message: "Doesn't match confirmation"}
  validates :name, uniqueness:true, length: {maximum: 30, minimun:6, too_long:"Maximum department name length is 30", too_short: "Minimum department name length is 6"}

<<<<<<< HEAD
=======
  #callbacks
  after_destroy CallBack

>>>>>>> 430002edb225bad7c293c1f4647d3d02798b6513
end
