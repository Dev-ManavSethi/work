class Assignment < ApplicationRecord
  belongs_to :department
  belongs_to :teacher
  belongs_to :assigned, polymorphic: true
end
