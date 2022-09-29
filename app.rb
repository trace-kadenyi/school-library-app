require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'classroom'
class App
  attr_reader :books, :person, :rentals

  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  # create a person (teacher or student, not a plain Person)
  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp.to_i

    case person_type
    when 1
      create_student
    when 2
      create_teacher
    else
      # if input is not 1 or 2
      puts 'That is not a valid input'
    end
  end

  # create a student
  def create_student
    puts 'Enter student\'s name: '
    name = gets.chomp

    puts 'Enter student\'s age: '
    age = gets.chomp.to_i
    if age < 3 || age > 18
      puts 'Please enter a valid age (between 3 and 18)'
      return
    end

    puts 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.capitalize
    case parent_permission
    when 'Y'
      parent_permission = true
    when 'N'
      parent_permission = false
    else
      # if input is not Y or N
      puts 'That is not a valid input. Please enter Y or N'
      return
    end

    student = Student.new(age, name, parent_permission)
    @persons << student
    puts 'Student created successfully'
  end

  # create a teacher
  def create_teacher
    puts 'Enter teacher\'s name: '
    name = gets.chomp

    puts 'Enter teacher\'s age: '
    age = gets.chomp.to_i
    if age < 18 || age > 70
      puts 'Please enter a valid age (between 18 and 70)'
      return
    end

    puts 'Enter teacher\'s specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(age, name, specialization)
    @persons << teacher
    puts 'Teacher created successfully'
  end

  # create a book
  def create_book
    puts 'Enter book\'s title: '
    title = gets.chomp

    puts 'Enter book\'s author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end

  # list all books
  def list_books
    if @books.length.positive?
      @books.each_with_index do |book, index|
        puts "#{index}). Title: #{book.title}, Author: #{book.author}"
      end
    else
      # if no books exist
      puts 'There are no books'
    end
    sleep(2)
  end

  # list all people
  def list_people
    if @persons.length.positive?
      @persons.each do |person|
        puts "[#{person.class}] Name: #{person.name}, Age: #{person.age} years, ID: #{person.id}"
      end
    else
      # if no persons exist
      puts 'There are no people'
    end
    sleep(2)
  end

  # create a rental if books and persons exist
  def create_rental
    if @books.length.positive? && @persons.length.positive?
      puts 'Select a book from the following list by number'
      @books.each_with_index do |book, index|
        puts "#{index}). Title: '#{book.title}' by Author: #{book.author}"
      end
      book_index = gets.chomp.to_i

      puts 'Select a person from the following list by number'
      @persons.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
      person_index = gets.chomp.to_i

      puts 'Enter date: '
      date = gets.chomp

      rental = Rental.new(date, @persons[person_index], @books[book_index])
      @rentals << rental
      puts 'Rental created successfully'
    else
      # if no books or persons exist
      puts 'No books or persons found. Please create at least one book and person first'
    end
    sleep(2)
  end

  # list all rentals for a given person id
  def list_rentals
    puts 'Enter person ID: '
    person_id = gets.chomp.to_i

    rentals = @rentals.filter { |rental| rental.person.id == person_id }
    if rentals.length.positive?
      puts 'Rentals:'
      rentals.each_with_index do |rental, index|
        puts "#{index}). Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
      end
    else
      # if no rentals exist
      puts 'No rentals found for the given person ID'
    end
    sleep(2)
  end
end