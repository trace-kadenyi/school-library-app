require_relative 'person'

class Student < Person
  attr_reader :classroom, :parent_permission

  def initialize(name, age, classroom, _parent_permission)
    super(name, age, parent_permission: true)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end
end
