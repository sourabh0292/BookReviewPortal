class Review < ApplicationRecord
    before_save :sentiment
		belongs_to :u_ser
		belongs_to :book
    after_create :review_send

    def sentiment
      string = comment.split(" ")
      total = 0
      string.each do |s|
        total += Sentiment.hash(s) if Sentiment.hash(s)
       end
         self.sentiment_score = total
    end

    def review_send
      ReviewmailWorker.perform_async(self.id)
    end
end
