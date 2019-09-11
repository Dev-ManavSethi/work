class Assignment < ApplicationRecord
  belongs_to :assigned, polymorphic: true
end
