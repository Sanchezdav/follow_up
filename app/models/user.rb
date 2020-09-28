require 'open-uri'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[twitter]

  has_person_name
  has_one_attached :avatar
  has_many :projects, dependent: :destroy

  validates :name, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.username = auth.info.nickname

      downloaded_image = open(auth.info.image)
      user.avatar.attach(io: downloaded_image, filename: "avatar.jpg")

      # If you are using confirmable uncomment next line.
      # user.skip_confirmation!
    end
  end
end
