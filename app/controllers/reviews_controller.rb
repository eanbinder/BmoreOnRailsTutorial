class ReviewsController < ApplicationController
    def new
        @book = Book.find(params[:book_id])
        @review = @book.reviews.build
    end
    
    def create
        book = Book.find(params[:book_id])
        book.reviews.create(review_params)
        redirect_to book_path(book)
    end
    
    def review_params
        #Strong parameters forces us to explcitly state what attributes can be set to prevent malicious data from entering our applications
        permitted_params = params.require(:review).permit(:body)
        permitted_params.merge(user_id: session[:user_id])
        #require a review hash, allow a body attribute within this that we can add to a new review
        #params otherwise has a bunch of data we don't want to deal with right now 
        
    end
    
    
end