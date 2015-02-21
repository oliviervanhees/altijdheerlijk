class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :pins

  acts_as_voter
  acts_as_votable
  
	def self.from_omniauth(auth)
      where(provider2: auth.provider, uid2: auth.uid).first_or_create do |user|
        user.provider2 = auth.provider
        user.uid2 = auth.uid
        user.email = auth.info.email
        user.name = auth.info.name
        user.image_file_name = auth.info.image
        user.password = Devise.friendly_token[0,20]
      end
  end

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/default.jpg"
end
