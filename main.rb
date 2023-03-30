#!/usr/bin/env ruby

require_relative './show_menu'
require_relative './process_options'
require_relative './app'
require_relative './utilities'

def main
  app = App.new
  load_data
  loop do
    show_menu
    user_input = gets.chomp.upcase
    puts
    if user_input == 'D'
      puts "\e[31mThank you for using this app! ♥️ \e[0m"
      save_data
      exit
    end
    process_options(user_input, app)
  end
end
main
