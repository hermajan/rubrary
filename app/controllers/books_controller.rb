class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @books = Book.all.order(:name)
    #@important = Task.where("priority < '0'").order(:priority).all
  end

  def show
    @book = Book.find(params[:id])
    #@book.tasks = @book.tasks.where('book_id' => params[:id]).order(:priority)
  end

  def completed
    @book = Book.find(params[:id])
    #@completed_tasks = @book.tasks.where('book_id' => params[:id]).order(:priority).only_deleted

    render 'show'
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
    # tasks = @book.tasks.with_deleted.where('book_id' => params[:id])
    # tasks.each do |task|
    #   task.really_destroy!
    # end
    @book.destroy

    redirect_to books_path
  end

  private
    def book_params
      params.require(:book).permit(:name, :author_id, :year, :isbn)
    end
end
