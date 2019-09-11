class Subject < ApplicationRecord
  belongs_to :department, required: true, validate: true, autosave: true, counter_cache: true, dependent: :destroy, inverse_of: :subjects, touch: :departments_updated_at
  has_and_belongs_to_many :teachers
  has_and_belongs_to_many :students
end
