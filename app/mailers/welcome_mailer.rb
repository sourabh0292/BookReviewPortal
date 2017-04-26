class WelcomeMailer < ApplicationMailer

def welcome_send(user)
	@user = user
	mail to: @user.email, subject: "Welcome aboard", from: 'sourabhtolani02@gmail.com'

	end

end
