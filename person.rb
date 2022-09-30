require_relative 'decorators'
require 'pry'

class Person
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  # can use services
  def can_use_services?
    of_age? || @parent_permission
  end

  # validate name
  def correct_name
    @name
  end

  #  add rental
  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  # private method
  private

  def of_age?
    age >= 18
  end
end

person = Person.new('John', 18, parent_permission: true)
puts person.can_use_services?
puts person.correct_name

# start a REPL session
binding.pry

# program resumes here (after pry session)
puts 'program resumes here.'
