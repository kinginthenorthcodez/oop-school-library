require_relative './person'

class Teacher < Person
  def initialize(specializtion)
    super(age, name, _parent_permission)
    @specializtion = specializtion
  end

  def can_use_services?
    p true
  end
end

teacher = Teacher.new('machine learning')
teacher.can_use_services?

teacher.name = 'Galileo'
p teacher.name
