require_relative './app'
require 'json'
require 'fileutils'

def load_data(app)
  files = ['person.json', 'rental.json', 'book.json']
  files.each do |file|
    if File.exist?(file)
      load_persons(app)
      load_books(app)
      load_rentals(app)
      break
    else
      File.write(file, [])
    end
  end
end

def load_persons(app)
  persons = JSON.parse(File.read('person.json'))
  persons.each do |person|
    if person['type'] == 'Student'
      student = Student.new(person['name'], person['age'], person['permission'])
      app.persons.push(student)
    else
      teacher = Teacher.new(person['specialization'], person['age'], person['name'])
      app.persons.push(teacher)
    end
  end
end

def load_books(app)
  books = JSON.parse(File.read('book.json'))
  books.each do |book|
    book = Book.new(book['title'], book['author'])
    app.books.push(book)
  end
end

def load_rentals(app)
  rentals = JSON.parse(File.read('rental.json'))
  rentals.each do |rental|
    rental = Rental.new(rental['date'], app.persons[rental['person_index']], app.books[rental['book_index']])
    app.rentals.push(rental)
  end
end
