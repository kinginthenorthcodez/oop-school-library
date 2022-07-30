require './nameable'
require './book'
require './rental'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name, _parent_permission)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @rentals = []
  end

  def add_rentals(rental)
    @rentals.push(rental)
    rental.person = self
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
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < BaseDecorator
  def initialize(nameable)
    super(nameable)
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < BaseDecorator
  def initialize(nameable)
    super(nameable)
    @nameable = nameable
  end

  def correct_name
    if @nameable.correct_name.length > 10
      @nameable.correct_name.slice(0...10)
    else
      @nameable.correct_name
    end
  end
end
