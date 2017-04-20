class BooksController < ApplicationController
	before_action :find_book, only: [:show, :update, :destroy, :edit]
	before_action :authenticate_u_ser!, only: [:new, :edit]

	def index
		
		if params[:format]
			@books = Book.where(id: params[:format].split("/"))

		else
	 	if params[:category].blank?
	 	@books = Book.all.order("created_at DESC")
		else
		@category_id = Category.find_by(name: params[:category]).id
		@books = Book.where(category_id: @category_id).order("created_at DESC") 
		end
		 end
	end	

	def new

	@book = current_u_ser.books.build
	@categories = Category.all.map{ |c| [c.name, c.id]}

	end	


	def show 
		if @book.reviews.blank?
			@average_review = 0
		else
			@average_review = @book.reviews.average(:rating).round(2)
		end
	end

	

	def create
		@book = current_u_ser.books.build(book_params)
		@book.category_id = params[:category_id]
		
		if @book.save
			redirect_to root_path
		else
			render 'new'
		 end
		end
	
	def edit
	@categories = Category.all.map{ |c| [c.name, c.id]}

	end

	def search
	
	@search = Book.where("title LIKE '%#{params[:search][:search]}%'") 
		
	redirect_to books_path(@search.ids )

	end


	def update
		@book.category_id = params[:category_id]
		if @book.update(book_params)
		redirect_to book_path(@book)
		else
		render 'edit'
		end	
	end


	def destroy
		@book.destroy
		redirect_to root_path
	end

def find_book
	@book = Book.find(params[:id])

end	


private 

def book_params
	params.require(:book).permit(:title, :description, :author, :category_id, :book_img)
end

def search_params
	params[:search][:search]
	#params.require(:search).permit(:search)
end

end
