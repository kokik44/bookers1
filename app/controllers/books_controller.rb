class BooksController < ApplicationController

  def new
    @book = Book.new
    @books = Book.all
     logger.debug("標準出力とログファイルに記録される")
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
     @book = Book.find(params[:id])

  end

  def create
    @book = Book.new(book_params)
    @books = Book.all
    # booker = Booker.create(booker_params)
    # booker.save
    if @book.save
      redirect_to book_path(@book)
      flash[:notice] = "Book was successfully created."
    else
       render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_update_params)
      @book.save
      redirect_to book_path(@book)
      flash[:notice] = "Book was successfully updated."
    else
      render :edit
    end
  end

  def destroy
      book = Book.find(params[:id])
      book.destroy

      if book.destroy
        redirect_to '/books'
      flash[:notice] = "Book was successfully deleted."
      else
       flash[:notice] = "error occured"
      end
  end

  private
   def book_params
    params.require(:book).permit(:title,:body)
   end
   def book_update_params
     params.require(:book).permit(:title,:body)
   end
end

