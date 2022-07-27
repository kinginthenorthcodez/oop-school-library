require './nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name, _parent_permission)
    super
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

  def correct_name
    @name
  end
end

class BaseDecorator < Nameable
  def initialize(nameable)
    super
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    if @nameable.correct_name.length > 10
      @nameable.correct_name.slice(0...10)
    else
      @nameable.correct_name
    end
  end
end

person = Person.new(27, 'nanishisaac', true)
p person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
p capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalizedPerson)
p capitalized_trimmed_person.correct_name
