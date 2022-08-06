def parse_int
  input_id = gets.chomp
  input_id.to_i if input_id.to_i.positive?
end

def parse_date
  date = gets.chomp
  date if date.match(/^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$/)
end

def parse_string
  string = gets.chomp
  string if string.length.positive?
end

def parse_bool
  option = gets.chomp
  case option.to_s.upcase
  when 'Y'
    option = true
  when 'N'
    option = false
  end
  option
end
