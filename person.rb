class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name, _parent_permission)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?(parent_permission)
    of_age? || parent_permission
  end
end
