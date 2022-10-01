require_relative 'app'

class Main
  def initialize
    @app = App.new
    @option = 0
    @run = true
  end

  def menu_options
    puts 'WELCOME TO THE SCHOOL LIBRARY APP!'
    while @run
      puts 'Please choose an option from the menu below by entering a number: '
      puts '1 - List all books'
      puts '2 - List all people'
      puts '3 - Create a person'
      puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals for a given person id'
      puts '7 - List all rented books'
      puts '8 - Exit'
      start_app
    end
  end

  def start_app
    @option = gets.chomp.to_i
    case @option
    when 1
      @app.list_books
    when 2
      @app.list_people
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.list_rentals
    when 7
      @app.list_rented_books
    when 8
      @run = false
    end
  end

  def end_app
    puts 'Thank you for using this app!'
  end
end

main = Main.new
main.menu_options
main.end_app
