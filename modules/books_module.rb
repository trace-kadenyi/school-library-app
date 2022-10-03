require './book'

class BooksModule
  attr_accessor :books

  def initialize(books)
    @books = books
  end

  # create a book
  def create_book
    puts 'Enter book\'s title: '
    title = gets.chomp

    puts 'Enter book\'s author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book
    puts
    puts 'Book created successfully'
    puts
    sleep(2)
  end

  # list all books
  def list_books
    if @books.length.positive?
      @books.each_with_index do |book, index|
        puts "#{index}). Title: #{book.title}, Author: #{book.author}"
      end
    else
      # if no books exist
      puts
      puts 'There are no books'
    end
    puts
    sleep(2)
  end
end
