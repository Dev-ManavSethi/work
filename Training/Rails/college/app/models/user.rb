class User < ApplicationRecord

  devise :omniauthable, omniauth_providers: [:google_oauth2]
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :validatable , stretches: 13
  
  validates :name, :email, :password, presence: true #:phone, :date_of_birth, :accepted_tos, presence: true
  # validates :accepted_tos, inclusion: {in: ["1", 1, true, "true"]}
  validates :email , uniqueness: true
  validates :phone , uniqueness: true
  #validates :gender, inclusion: {in: %w("m", "f")}
  has_one :image, as: :image_profile

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # user to be created if they don't exist
    unless user
      user = User.create(name: data['name'], email: data['email'], password: Devise.friendly_token[0,20])
    end
    user
end

end
