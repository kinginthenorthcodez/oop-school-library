class Classroom
  attr_accessor :lable
  attr_reader :students

  def initialize(lable)
    @lable = lable
    @students = []
  end

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end
end

class_b = Classroom.new('Class B')
p class_b.lable
p class_b.students
