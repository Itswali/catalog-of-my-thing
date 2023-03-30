require_relative './classes/book'
require_relative './classes/label'
require_relative './classes/genre'
require_relative './classes/music_album'
require_relative './classes/author'
require_relative './classes/game'

class App
  attr_reader :books, :labels

  def initialize
    @books = []
    @labels = []
    @genre = []
    @music_album = []
    @author = []
  end

  def list_all_authors
    puts "\nNo authors added yet" if Author.list_all_authors.empty?
    puts "\nAll authors:\n\n"
    puts "\nfirst_name \t| last_name"
    puts "\n--------------------------------------------"
    Author.list_all_authors.each_with_index do |author, i|
      puts "#{i + 1} first name: #{author.first_name} \t| last name: #{author.last_name}"
      puts "\n--------------------------------------------"
    end
  end

  def list_all_labels
    puts "\nNo labels added yet" if Label.list_all_label.empty?
    puts "\nAll Labels:\n\n"
    puts "\nLabels \t| Color"
    puts "\n--------------------------------------------"
    Label.list_all_label.each_with_index do |label, i|
      puts "#{i + 1} label: #{label.title} \t| label: #{label.color}"
      puts "\n--------------------------------------------"
    end
  end

  def list_all_genre
    puts "\nNo labels added yet" if Genre.list_all_genre.empty?
    puts "\nAll genre:\n\n"
    puts "\ngenre \t| Color"
    puts "\n--------------------------------------------"
    Genre.list_all_genre.each_with_index do |genre, i|
      puts "#{i + 1} \t| #{genre.name}"
      puts "\n--------------------------------------------"
    end
  end

  def add_game
    puts "\nAdd a new game"
    print 'author first name:'
    first_name = gets.chomp
    print 'author last name'
    last_name = gets.chomp
    author_obj = Author.create_author(first_name, last_name)
    print 'genre:'
    genre = gets.chomp
    genre_obj = Genre.create_genre(genre)
    print 'label title:'
    label_title = gets.chomp
    print 'label color:'
    label_color = gets.chomp
    label_obj = Label.create_label(label_title, label_color)
    print 'publish_date:'
    publish_date = gets.chomp
    print 'Publisher:'
    publisher = gets.chomp
    Game.new(genre_obj, author_obj, label_obj, publish_date, publisher)
    puts 'Your book has been added successfully!'
  end

  def add_book
    puts "\nAdd a new book"
    print 'author first name:'
    first_name = gets.chomp
    print 'author last name'
    last_name = gets.chomp
    author_obj = Author.create_author(first_name, last_name)
    print 'genre:'
    genre = gets.chomp
    genre_obj = Genre.create_genre(genre)
    print 'label title:'
    label_title = gets.chomp
    print 'label color:'
    label_color = gets.chomp
    label_obj = Label.create_label(label_title, label_color)
    print 'publish_date:'
    publish_date = gets.chomp
    print 'Publisher:'
    publisher = gets.chomp
    print 'Cover State:'
    cover_state = gets.chomp
    book = Book.new(genre_obj, author_obj, label_obj, publish_date, publisher)
    book.cover_state = cover_state
    puts 'Your book has been added successfully!'
  end

  def add_music
    puts "\nAdd a new music"
    print 'author first name:'
    first_name = gets.chomp
    print 'author last name'
    last_name = gets.chomp
    author_obj = Author.create_author(first_name, last_name)
    print 'genre:'
    genre = gets.chomp
    genre_obj = Genre.create_genre(genre)
    print 'label title:'
    label_title = gets.chomp
    print 'label color:'
    label_color = gets.chomp
    label_obj = Label.create_label(label_title, label_color)
    print 'publish_date:'
    publish_date = gets.chomp
    Music_album.new(genre_obj, author_obj, label_obj, publish_date)
    puts 'Your Musicalbum has been added successfully!'
  end

  def list_all_albums
    puts "\nNo albums added yet" if Music_album.list_all_music_album.empty?
    puts "\nAll albums:\n\n"
    puts "\nalbum \t| Color"
    puts "\n--------------------------------------------"
    Music_album.list_all_music_album.each_with_index do |album, i|
      puts "#{i + 1} \t|:album #{album.genre.name}  author: #{"#{album.author.first_name} #{album.author.last_name}"} label: #{"#{album.label.title} #{album.label.color}"} publish_date: #{album.publish_date}"
      puts "\n--------------------------------------------"
    end
  end

  def list_all_books
    puts "\nNo books added yet" if Book.list_all_books.empty?
    puts "\nAll books:\n\n"
    puts "\npublisher \t| cover_state"
    puts "\n--------------------------------------------"
    Book.list_all_books.each_with_index do |book, i|
      puts "#{i + 1} \t|:genre #{book.genre.name}  author: #{"#{book.author.first_name} #{book.author.last_name}"} label: #{"#{book.label.title} #{book.label.color}"} publish_date: #{book.publish_date} cover_state: #{book.cover_state} publisher: #{book.publisher}"
      puts "\n--------------------------------------------"
    end
  end

  def list_all_games
    puts "\nNo games added yet" if Game.list_all_games.empty?
    puts "\nAll books:\n\n"
    puts "\nmultiplayer \t| last_played_at"
    puts "\n--------------------------------------------"
    Game.list_all_games.each_with_index do |game, i|
      puts "#{i + 1} \t|:genre #{game.genre.name}  author: #{"#{game.author.first_name} #{game.author.last_name}"} label: #{"#{game.label.title} #{game.label.color}"} publish_date: #{game.publish_date} last_played_at #{game.last_played_at} multiplayer #{game.multiplayer}"
      puts "\n--------------------------------------------"
    end
  end
end
