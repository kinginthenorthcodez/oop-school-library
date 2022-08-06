require_relative './person'
require_relative './classroom'

class Student < Person
  attr_reader :classroom

  def initialize(name, age, parent_permission)
    super(age, name, parent_permission)
  end

  def play_hooky
    p "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
