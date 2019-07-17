class User < ApplicationRecord
  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :tasks, through: :projects

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :omniauthable
  
  validates :name, :email, :password, presence: true
  validates :name, :email, uniqueness: true
  validates :name, length: {minimum: 3}
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.name = auth.info.name
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
  
end
