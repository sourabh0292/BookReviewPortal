class ReviewmailWorker
 include Sidekiq::Worker

 def perform(review_id)
 	@review1 = review_id
	ReviewMailer.review_send(@review1).deliver
	end

 end 