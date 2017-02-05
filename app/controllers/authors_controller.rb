class AuthorsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @authors = Author.all.order(:name)
    #@important = Task.where("priority < '0'").order(:priority).all
  end

  def show
    @author = Author.find(params[:id])
    @author.books = @author.books.where('author_id' => params[:id]).order(:name)
  end

  def completed
    @author = Author.find(params[:id])
    #@completed_books = @author.books.where('author_id' => params[:id]).order(:priority).only_deleted

    render 'show'
  end

  def new
    @author = Author.new
  end

  def edit
    @author = Author.find(params[:id])
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to @author
    else
      render 'new'
    end
  end

  def update
    @author = Author.find(params[:id])

    if @author.update(author_params)
      redirect_to @author
    else
      render 'edit'
    end
  end

  def destroy
    @author = Author.find(params[:id])
    # books = @author.books.with_deleted.where('author_id' => params[:id])
    # books.each do |task|
    #   task.really_destroy!
    # end
    @author.destroy

    redirect_to authors_path
  end

  private
    def author_params
      params.require(:author).permit(:name)
    end
end
