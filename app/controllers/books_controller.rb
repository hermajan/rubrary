class BooksController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	
	def index
		@books = Book.all.order(:name)
	end

	def show
		@book = Book.find(params[:id])
		
		gr = Goodreads.new(Goodreads.configuration)
		if @book.isbn != ""
			@goodreads = gr.book_by_isbn(@book.isbn)
		else
			@goodreads = gr.book_by_title(@book.name)
		end
	end

	def new
		@book = Book.new
	end

	def edit
		@book = Book.find(params[:id])
	end

	def create
		@book = Book.new(book_params)

		if @book.save
			redirect_to @book
		else
			render 'new'
		end
	end

	def update
		@book = Book.find(params[:id])

		if @book.update(book_params)
			redirect_to @book
		else
			render 'edit'
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy

		redirect_to books_path
	end

	private
		def book_params
			params.require(:book).permit(:name, :author_id, :year, :isbn)
		end
end
