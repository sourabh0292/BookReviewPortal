class ReviewMailer < ApplicationMailer

	def review_send(review_id)
	
	@review = Review.find(review_id)
	@comment = @review.comment
	@rating = @review.rating
	@book = @review.book.title
	@user = @review.u_ser
	mail to: @user.email, subject: "Feedback Submitted", from: 'sourabhtolani02@gmail.com'
	end


end
