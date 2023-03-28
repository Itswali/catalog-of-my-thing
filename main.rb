#!/usr/bin/env ruby

require 'io/console'
require_relative './show_menu'
require_relative './process_options'
require_relative './app'

def main
  $stdout.clear_screen
  app = App.new
  loop do
    show_menu
    user_input = gets.chomp.upcase
    puts
    if user_input == 'D'
      puts "\e[31mThank you for using this app! ♥️ \e[0m"
      exit
    end
    process_options(user_input, app)
  end
end
main
