class User < ApplicationRecord
  devise :rememberable, :omniauthable, :database_authenticatable, omniauth_providers: [:google_oauth2]
end
