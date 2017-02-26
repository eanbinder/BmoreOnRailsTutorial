class Book < ApplicationRecord
    has_many :reviews
    #don’t have to make any database changes because the reviews table already has a book_id column so relationship is already defined in the database
end
