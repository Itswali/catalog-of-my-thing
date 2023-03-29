require 'boolean'
require_relative './classes/book'
require_relative './classes/label'
require_relative './classes/genre'
require_relative './classes/music_album'

class App
  attr_reader :books, :labels

  def initialize
    @books = []
    @labels = []
    @genre = []
  end

  def set_data
    genre_one = Genre.new('Rock')
    genre_dos = Genre.new('Rap')
    genre_tres = Genre.new('pop')
    # label_one
    @genre << genre_dos
    @genre << genre_one
    @genre << genre_tres
  end

  def list_all_books
    puts "\nNo books added yet" if @books.empty?
    puts "\nAll Books:\n\n"
    puts "\nPublisher \t| Cover State \t| Publish Date"
    puts '--------------------------------------------'
    @books.each do |book|
      puts "#{book.publisher} \t\t| #{book.cover_state} \t\t| #{book.publish_date}"
      puts '--------------------------------------------'
    end
  end

  def list_all_labels
    puts "\nNo labels added yet" if @labels.empty?
    puts "\nAll Labels:\n\n"
    puts "\nLabels \t| Color"
    puts "\n--------------------------------------------"
    @labels.each do |label|
      puts "#{label.title} \t| #{label.color}"
      puts "\n--------------------------------------------"
    end
  end

  def list_all_genre
    puts "\nNo labels added yet" if @genre.empty?
    puts "\nAll genre:\n\n"
    puts "\ngenre \t| Color"
    puts "\n--------------------------------------------"
    @genre.each_with_index do |genre, i|
      puts "#{i + 1} \t| #{genre.name}"
      puts "\n--------------------------------------------"
    end
  end

  def add_label
    puts "\nAdd a new label"
    print 'Title:'
    title = gets.chomp
    print 'Color:'
    color = gets.chomp
    print 'items:'
    items = gets.chomp
    label = Label.new(title, color, items)
    @labels << label
    puts 'Your label has been added successfully!'
  end

  def add_book
    puts "\nAdd a new book"
    print 'Publisher:'
    publisher = gets.chomp
    print 'Cover State:'
    cover_state = gets.chomp
    print 'Publish Date[YYYY/MM/DD]:'
    publish_date = gets.chomp
    @books << Book.new(publisher, cover_state, publish_date)
    puts 'Your book has been added successfully!'
  end

def add_music
  puts "\nAdd a new music"
  print 'author:'
  author = gets.chomp.to_s
  print 'genre:'
  genre = gets.chomp.to_s
  print 'label:'
  label = gets.chomp.to_s
  print 'publish_date:'
  publish_date = gets.chomp.to_s
  print 'on_spotify:'
  on_spotify = gets.chomp.to_s
  music_album = Musicalbum.new(genre: genre, author: author, label: label, publish_date: publish_date)
  @Musicalbum << Musicalbum
  puts 'Your Musicalbum has been added successfully!'
end
end