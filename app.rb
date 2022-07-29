require_relative 'book'
require_relative 'rental'
require_relative 'teacher'
require_relative 'student'

choice = gets.chomp

case choice

  when '1'
    puts 'List of books'
    book_list_helper
  when '2'
    puts 'List of people'
  when '3'
    puts 'Creating teacher (1)  or student (2) enter number : '
    ch = gets.chomp
    case ch
      when '1'
        puts 'teacher created successfully'
      when '2'
        puts 'studemt created successfully'
    else
      puts 'default'
    end
  when '4'
    puts 'Create book'
  when '5'
    puts 'Create rental'
  when '6'
    puts 'List all rentals'
  when '7'
    puts 'Exit'
else
  puts 'default'
end
