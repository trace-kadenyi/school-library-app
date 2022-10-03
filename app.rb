require_relative 'modules/person_module'
require_relative 'modules/rental_module'
require_relative 'modules/books_module'

class App
  attr_reader :books, :person, :rentals

  def initialize
    @option = 0
    @persons = []
    @rentals = []
    @books = []
    @rentals = RentalModule.new({ rentals: @rentals, persons: @persons, books: @books })
    @persons = PersonModule.new(@persons)
    @books = BooksModule.new(@books)
  end

  # offer menu options
  def menu_options
    puts 'WELCOME TO THE SCHOOL LIBRARY APP!'
    while @option != 7
      puts 'Please choose an option from the menu below by entering a number: '
      puts '1 - List all books'
      puts '2 - List all persons'
      puts '3 - Create a person'
      puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals for a given person id'
      puts '7 - Exit'
      start_app
    end
  end

  # start the app
  def start_app
    @option = gets.chomp.to_i
    case @option
    when 1
      @books.list_books
    when 2
      @persons.list_persons
    when 3
      @persons.create_person
    when 4
      @books.create_book
    when 5
      @rentals.create_rental
    when 6
      @rentals.list_rentals
    end
  end
end
