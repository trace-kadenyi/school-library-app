class Person
  def initialize(name = "Unknown", age, parent_permission: true)
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age
  attr_reader :id

  # private method
  def is_of_age?
    if age >= 18
      true
    else
      false
    end
  end

  # public method 
  def can_use_services?
    if is_of_age? || parent_permission
      true
    else
      false
    end
  end
# declare private and public methods
  private :is_of_age?
  public :can_use_services?
end

# create new person
person = Person.new("John", 18)
# print person's name
puts person.is_of_age?