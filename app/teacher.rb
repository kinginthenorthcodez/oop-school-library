require_relative './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name, parent_permission: true)
    super(age, name)
    @specialization = specialization
    @parent_permission = parent_permission
  end

  def can_use_services?
    p true
  end
end
