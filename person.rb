require_relative 'nameable'
require_relative 'decorators'

class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age
  attr_reader :id

  # can use services
  def can_use_services?
    of_age? || @parent_permission
  end

  # adjust name
  def correct_name
    @name
  end

  # private method
  private

  def of_age?
    age >= 18
  end
end

person = Person.new(22, 'maximilianus')
puts person.correct_name

CapitalizedPerson = CapitalizeDecorator.new(person)
puts CapitalizedPerson.correct_name

CapitalizedTrimmedPerson = TrimmerDecorator.new(CapitalizedPerson)
puts CapitalizedTrimmedPerson.correct_name
