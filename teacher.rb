require_relative './person'

class Teacher < Person
  def initialize(specializtion)
    super(age, name, true)
    @specializtion = specializtion
  end

  def can_use_services?
    p true
  end
end

teacher = Teacher.new('machine learning')
teacher.can_use_services?

# teacher.name = 'galileo'
# teacher.age = 27
# p teacher.name
# capital_name = CapitalizeDecorator.new(teacher)
# p capital_name.correct_name
