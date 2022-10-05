require './classroom'
require './person'
require './teacher'
require './student'
require 'json'

class PersonModule
  attr_accessor :persons, :file_location

  def initialize
    @file_location = 'storage/person.json'
    file = File.open(@file_location, 'a+')
    @persons = file.size.zero? ? [] : JSON.parse(file.read)
    file.close
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
      puts
      puts 'That is not a valid input'
    end
  end

  # create a student
  def create_student
    file = File.open(@file_location, 'w')
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
    puts 'Enter student\'s classroom: '
    classroom = gets.chomp
    student_class = Classroom.new(classroom)
    student = Student.new(age, name, student_class, parent_permission)
    student = student.to_json
    @persons << student
    file.write(JSON[@persons])
    file.close
    puts
    puts 'Student created successfully'
    puts
    sleep(2)
  end

  # create a teacher
  def create_teacher
    file = File.open(@file_location, 'w')
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
    teacher = teacher.to_json
    @persons << teacher
    file.write(JSON[@persons])
    file.close
    puts
    puts 'Teacher created successfully'
    puts
    sleep(2)
  end

  # list all persons
  def list_persons
    if @persons.length.positive?
      @persons.each do |person|
        puts "[#{person['json_class']}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
      end
    else
      # if no persons exist
      puts
      puts 'There are no persons'
    end
    puts
    sleep(2)
  end
end
