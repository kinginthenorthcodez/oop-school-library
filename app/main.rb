require_relative './app'
require_relative './menu'
require_relative './selection'
require_relative './inputs'
require_relative './initializeapp'
require_relative './save'

def main
  choice = nil, app = App.new
  puts 'Initaiting program...'
  sleep(5)
  load_data(app)
  puts 'Welcome to School Library'
  sleep(5)
  system('cls') || system('clear')
  sleep(5)
  puts 'Loading menu...'
  sleep(5)
  system('cls') || system('clear')
  loop do
    puts 'Please choose an option by entering a number :'
    menu
    choice = parse_int
    run_selection(choice, app)
    break if choice == 7
  end
  exit_app(app)
end

def exit_app(app)
  save_data(app)
  puts 'Exiting...'
  sleep(5)
  puts 'Thank you for using our library'
end
main
