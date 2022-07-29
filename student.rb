require_relative './person'
require_relative './classroom'

class Student < Person
  attr_reader :classroom

  def initialize(classroom)
    super(age, name, _parent_permission: true)
    @classroom = classroom
  end

  def play_hooky
    p "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end

student = Student.new('CS-50')

student.name = 'Nanish'
student.age = 17

p student.classroom
p student.id
p student.name
p student.age
p student.age

p student.can_use_services?(true)
student.play_hooky
p student.classroom
