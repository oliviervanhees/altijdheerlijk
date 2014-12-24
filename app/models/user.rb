class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
	has_many :pins

	def self.from_omniauth(auth)
      where(provider2: auth.provider, uid2: auth.uid).first_or_create do |user|
        user.provider2 = auth.provider
        user.uid2 = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
  end
  
end
