require_relative './app'

def main
  choice = nil, app = App.new
  puts 'Welcome to School Library'
  loop do
    puts 'Please choose an option by entering a number :'
    puts menu
    choice = gets.chomp
    choice = choice.to_i
    run_selection(choice, app)
    break if choice == 7
  end
  puts 'Thank you for using our library'
end

def menu
  puts "
          [1] - List all books'
          [2] - List all people'
          [3] - Create a person'
          [4] - Create a book'
          [5] - Create a rental'
          [6] - List all rentals for a given id'
          [7] - Exit "
end

def run_selection(choice, app)
  case choice
  when 1
    app.list_books
  when 2
    app.list_people
  when 3
    app.create_person
  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    app.list_rentals
  else
    puts 'Wrong input : try again'
  end
end
main
