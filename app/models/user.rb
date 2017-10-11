class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable



  include Authenticatable

  def self.authentication_keys
    [:email]
  end

  # include DeviseTokenAuth::Concerns::User
  # has_secure_token
  # has_secure_password

  # validates :full_name, presence: true
  has_many :posts, dependent: :destroy
end