require_relative 'app'

class Startup
  def initialize
    @app = App.new
    @option = 0
  end

  # offer menu options
  def menu_options
    puts 'WELCOME TO THE SCHOOL LIBRARY APP!'
    while @option != 7
      puts 'Please choose an option from the menu below by entering a number: '
      puts '1 - List all books'
      puts '2 - List all people'
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
    end
  end
end

class Main
  def main
    launch = Startup.new
    launch.menu_options
  end

  def end_app
    puts 'Thank you for using this app!'
  end
end

main = Main.new
main.main
main.end_app
