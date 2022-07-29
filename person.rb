require './nameable'
require './book'
require './rental'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age, name, _parent_permission)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @rentals = []
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

person = Person.new(27, 'nanishisaac', true)
person2 = Person.new(28, 'Maqueen', true)
book1 = Book.new('JK Rowling', 'Harry Potter')
book2 = Book.new('george R.R martin', 'Game of Thrones')

p person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
p capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
p capitalized_trimmed_person.correct_name

p '** PERSON RENTALS Before***'
p person.rentals

p '** Book RENTALS Before***'
p book1.rentals
p book2.rentals

Rental.new('2022-07-29', person, book1)
Rental.new('2022-07-29', person2, book1)
Rental.new('2022-07-29', person2, book2)

p '** PERSON RENTALS After***'
p person.rentals.count

p '** Book RENTALS After***'
p book1.rentals.count
p book2.rentals.count
