require_relative './person'

class Teacher < Person
  def initialize(specializtion, age, name, parent_permission: true)
    super(age, name, true)
    @specializtion = specializtion
    @parent_permission = parent_permission
  end

  def can_use_services?
    p true
  end
end
