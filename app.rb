require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './rental'
require_relative './book'

class App
  attr_accessor :books, :persons, :rentals

  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def list_books
    puts '**Book List**'
    books.each_with_index do |book, index|
      puts "[#{index + 1}] Title: #{book.title} by #{book.author}"
    end
  end

  def list_people
    puts 'All people'
    persons.each_with_index do |person, index|
      puts "[#{index + 1}] ID: #{person.id} Name: #{person.name} Age: #{person.age}"
    end
  end

  def create_teacher
    puts 'Creating teacher...'
    name = '', age = 0, specialization = ''
    loop do
      print 'Name: '
      name = gets.chomp
      print "\n"
      print 'Age: '
      age = gets.chomp
      print "\n"
      print 'specialization: '
      specialization = gets.chomp
      print "\n"
      age = age.to_i
      break if name.length.positive? && specialization.length.positive? && age.positive?

      puts 'Wrong input'
    end
    puts "Teacher entered.. #{name}  #{age} #{specialization}"
    Teacher.new(specialization, age, name)
  end

  def create_student
    puts 'Creating student...'
    name = '', age = 0, parent_permission = false
    loop do
      print 'Name: '
      name = gets.chomp
      print "\n"
      print 'Age: '
      age = gets.chomp
      age = age.to_i
      print "\n"
      print 'Has parent permission [Y/N]: '
      answer = gets.chomp
      parent_permission = true if answer.upcase == 'Y' && age > 18
      print "\n"
      break if name.length.positive? && [true, false].include?(parent_permission) && age.positive?

      puts 'Wrong input: Try again *'
    end
    puts "Student entered.. #{name}  #{age} #{parent_permission}"
    Student.new(name, age, parent_permission)
  end

  def create_person
    loop do
      print "\n"
      print 'Do you want to create a student(1) or teacher(2)? [input number]: '
      answer = gets.chomp
      answer = answer.to_i
      person = nil
      case answer
      when 1
        person = create_student
      when 2
        person = create_teacher
      else
        puts 'Wrong input'
      end
      next unless person

      persons.push(person)
      puts 'Person created successfully'
      break
    end
  end

  def create_book
    puts 'Creating book...'
    title = '', author = ''
    loop do
      print 'Title: '
      title = gets.chomp
      print "\n"
      print 'Author: '
      author = gets.chomp
      print "\n"
      break if title.length.positive? && author.length.positive?

      puts 'Wrong input: Try again *'
    end
    puts "Book entered.. #{title}  #{author}"
    book = Book.new(title, author)
    books.push(book)
  end

  def create_rental
    return if persons.empty? || books.empty?

    date = '', person_index = 0, book_index = 0
    loop do
      list_people
      puts 'Select a person from persons listed by number: '
      person_index = parse_int
      list_books
      puts 'Select a book from books listed by number: : '
      book_index = parse_int
      puts 'Enter date : [2022-07-24 | yy.mm.dd]'
      date = parse_date
      break if person_index.positive? && book_index.positive? && date

      puts 'Wrong input: Try again *'
    end
    person = persons[person_index - 1]
    book = books[book_index - 1]
    rental = Rental.new(date, person, book)
    rentals.push(rental)
  end

  def list_rentals
    list_people
    loop do
      print 'Enter ID of person from listed persons'
      selcted_person = nil
      id = parse_int
      persons.each do |person|
        if person.id == id
          selcted_person = person
          break
        end
      end
      unless selcted_person

        puts "Person not found with id #{id} : try again"
        next
      end
      selcted_person.rentals.each do |rent|
        puts "Title: #{rent.book.title} Author: #{rent.book.author} Date: #{rent.date}"
      end
      break
    end
  end
end

def parse_int
  input_id = gets.chomp
  input_id.to_i
end

def parse_date
  date = gets.chomp
  date if date.match(/^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$/)
end

# app = App.new
# app.create_person
# app.create_book
# app.list_books
# app.list_people
# app.create_rental
# app.list_rentals
