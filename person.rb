class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age
  attr_reader :id

  # private method
  def of_age?
    age >= 18
  end

  # public method
  def can_use_services?
    if of_age? || parent_permission
      true
    else
      false
    end
  end
  # declare private and public methods
  private :of_age?
  public :can_use_services?
end
