class BooksController < ApplicationController
    def index
        @books = Book.all
    end
    
    def show
        @id = params[:id]
        @book = Book.find(@id)
    end
    
    def new
        @book = Book.new
        #gives us form and unsaved instance of book 
    end
    
    def create
        #saves the new book to the database
        Book.create(book_params)
        redirect_to books_path
    end
    
    def edit
        @book = Book.find(params[:id])
    end
    
    def update
        book = Book.find(params[:id])
        book.update(book_params)
        redirect_to books_path
    end
    
    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to books_path
    end
    
    def book_params
       
        
        params.require(:book).permit(:title, :author, :price_cents, :quantity, :description)
    end

end