class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %w[discord google]

  has_many :todos, dependent: :destroy

  def self.from_omniauth(auth)
    image_available = Faraday.get(auth.info.image).status == 200

    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.remote_image_url = auth.info.image if image_available
    end
  end
end
