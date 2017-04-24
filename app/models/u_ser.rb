class USer < ApplicationRecord
	has_many :books	
	has_many :reviews
	after_create :welcome_send
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

def welcome_send
	WelcomeMailer.welcome_send(self).deliver
end

end
