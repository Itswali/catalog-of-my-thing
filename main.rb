# this is to create the main function
#!/usr/bin/env ruby

require_relative './show_menu'
require_relative './process_options'

def main
  loop do
    show_menu
    user_input = gets.chomp.upcase
    puts
    if user_input == 'D'
      puts "\e[31mThank you for using this app! ♥️ \e[0m"
      exit
    end
    process_options(user_input)
  end
end
main
