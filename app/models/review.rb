class Review < ApplicationRecord
    before_save :sentiment
		belongs_to :u_ser
		belongs_to :book


    def sentiment
      string = comment.split(" ")
      total = 0
      string.each do |s|
        total += Sentiment.hash(s) if Sentiment.hash(s)
       end
         self.sentiment_score = total
    end
end
