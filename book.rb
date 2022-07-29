class Book
  attr_accessor :title, :author
  attr_reader :rentals, :books

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    @books = []
  end

  def add_rentals(rental)
    @rentals.push(rental)
    rental.book = self
  end

  def add_book(book)
    @books.push(book)
    puts 'book created successefully'
  end

  def list_books
    @books.each { |book| puts "name: #{book.title} by #{book.author}" }
  end
end

def book_list_helper
  book1 = Book.new('JK Rowling', 'Harry Potter')
   book2 = Book.new('George RR Martin', 'Game of thrones')
  book1.add_book(book1)
  book1.add_book(book2)
  book1.list_books
end