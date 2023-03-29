def process_options(usr_inp, app)
  options = {
    '1' => -> { app.list_all_books },
    '2' => -> { puts 'You chose option 2' },
    '3' => -> { puts 'You chose option 3' },
    '4' => -> { puts 'You chose option 4' },
    '5' => -> { app.list_all_genre },
    '6' => -> { app.list_all_labels },
    '7' => -> { puts 'You chose option 7' },
    '8' => -> { puts 'You chose option 8' },
    '9' => -> { app.add_book },
    'A' => -> { app.add_music },
    'B' => -> { puts 'You chose option B' },
    'C' => -> { puts 'You chose option C' },
    'L' => -> { app.add_label }
  }

  chosen_option = usr_inp
  if options.key?(chosen_option)
    options[chosen_option].call
  else
    puts "\e[31mInvalid selection! please try again.\e[0m\n"
  end
end
