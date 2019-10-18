class User < ApplicationRecord
  has_many :access_tokens
  has_many :auth_tokens
end
