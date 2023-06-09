def process_options(usr_inp, app)
  options = {
    '1' => -> { app.list_all_books },
    '2' => -> { app.list_all_albums },
    '3' => -> { app.list_all_games },
    '4' => -> { app.list_all_genre },
    '5' => -> { app.list_all_labels },
    '6' => -> { app.list_all_authors },
    '7' => -> { app.add_book },
    '8' => -> { app.add_music },
    '9' => -> { app.add_game }
  }

  chosen_option = usr_inp
  if options.key?(chosen_option)
    options[chosen_option].call
  else
    puts "\e[31mInvalid selection! please try again.\e[0m\n"
  end
end
