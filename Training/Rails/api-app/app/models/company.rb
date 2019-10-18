class Company < ApplicationRecord
  has_one :api_key
  has_many :access_tokens
  has_many :auth_tokens

  validates :name, presence: true, uniqueness: true
end
