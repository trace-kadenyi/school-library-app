require './book'
require 'json'

class BooksModule
  attr_accessor :books
  attr_reader :file_location

  def initialize
    @file_location = 'storage/books.json'
    file = File.open(@file_location, 'a+')
    @books = file.size.zero? ? [] : JSON.parse(file.read)
    file.close
  end

  # create a book
  def create_book
    file = File.open(@file_location, 'w')
    puts 'Enter book\'s title: '
    title = gets.chomp

    puts 'Enter book\'s author: '
    author = gets.chomp

    book = Book.new(title, author)
    book = book.to_json
    @books << book
    file.write(JSON[@books])
    file.close
    puts
    puts 'Book created successfully'
    puts
    sleep(2)
  end

  # list all books
  def list_books
    if @books.length.positive?
      @books.each { |book| puts "Title: '#{book['title']}' by Author: #{book['author']}" }
    else
      # if no books exist
      puts
      puts 'There are no books'
    end
    puts
    sleep(2)
  end
end
