class ReviewsController < ApplicationController
	before_action :find_book
	before_action :find_reviews, only: [:edit, :update, :destroy]
	before_action :authenticate_u_ser!, only: [:new, :edit]

	def new
		@review = Review.new
	end

	def create 
		@review = Review.new(review_params)	
		@review.book_id = @book.id
		@review.u_ser_id = current_u_ser.id

		if @review.save
			redirect_to book_path(@book)
		else
			render 'new'
		end	
	end

	def edit
	end

	def destroy
		@review.destroy
		redirect_to book_path(@book)
	end


	def update
	if @review.update(review_params)
		redirect_to book_path(@book)
	else
		render 'edit'
	end

	end


	def find_book
	@book = Book.find(params[:book_id])

	end

	def find_reviews
	@review = Review.find(params[:id])

	end

	private

	def review_params
		params.require(:review).permit(:rating, :comment)	
	end
end