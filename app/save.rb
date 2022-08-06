require_relative './app'
require 'json'
require 'fileutils'

def save_data(app)
  save_persons(app)
  save_books(app)
end

def save_persons(app)
  persons_data = []
  app.persons.each do |person|
    if person.class.to_s == 'Student'
      std = { name: person.name, age: person.age, permission: person.parent_permission, type: person.class }
      persons_data.push(std)
    else
      teacher = { specialization: person.specialization, age: person.age, name: person.name, type: person.class }
      persons_data.push(teacher)
    end
  end
  File.write('person.json', JSON.generate(persons_data))
end

def save_books(app)
  books = []
  app.books.each do |book|
    book = { title: book.title, author: book.author }
    books.push(book)
  end
  File.write('book.json', JSON.generate(books))
end

def save_rentals(date, person_index, book_index)
  rentals = JSON.parse(File.read('rental.json'))
  rent = { date: date, person_index: person_index - 1, book_index: book_index - 1 }
  rentals.push(rent)
  File.write('rental.json', rentals.to_json)
end
