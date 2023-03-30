require 'json'
require_relative './classes/music_album'
require_relative './classes/label'
require_relative './classes/genre'
require_relative './classes/game'
require_relative './classes/book'
require_relative './classes/author'

def load_data
  load_authors
  load_genres
  load_labels
  load_games
  load_albums
  load_books
end

def save_data
  save_authors
  save_games
  save_genres
  save_albums
  save_books
  save_labels
end

def load_books
  return unless File.exist?('data/books.json') && File.size?('data/books.json')

  Book.from_hash_array(JSON.parse(File.read('data/books.json')))
end

def load_authors
  return unless File.exist?('data/authors.json') && File.size?('data/authors.json')

  Author.from_hash_array(JSON.parse(File.read('data/authors.json')))
end

def load_games
  return unless File.exist?('data/games.json') && File.size?('data/games.json')

  Game.from_hash_array(JSON.parse(File.read('data/games.json')))
end

def load_labels
  return unless File.exist?('data/labels.json') && File.size?('data/labels.json')

  Label.from_hash_array(JSON.parse(File.read('data/labels.json')))
end

def load_genres
  return unless File.exist?('data/genres.json') && File.size?('data/genres.json')

  Genre.from_hash_array(JSON.parse(File.read('data/genres.json')))
end

def load_albums
  return unless File.exist?('data/albums.json') && File.size?('data/albums.json')

  Music_album.from_hash_array(JSON.parse(File.read('data/albums.json')))
end

def save_authors
  File.exist?('data/authors.json') ? File.open('data/authors.json', 'w') : File.new('data/authors.json', 'w')
  File.write('data/authors.json', Author.list_all_authors.to_json)
end

def save_games
  File.exist?('data/games.json') ? File.open('data/games.json', 'w') : File.new('data/games.json', 'w')
  File.write('data/games.json', Game.list_all_games.to_json)
end

def save_genres
  File.exist?('data/genres.json') ? File.open('data/genres.json', 'w') : File.new('data/genres.json', 'w')
  File.write('data/genres.json', Genre.list_all_genre.to_json)
end

def save_albums
  File.exist?('data/albums.json') ? File.open('data/albums.json', 'w') : File.new('data/albums.json', 'w')
  File.write('data/albums.json', Music_album.list_all_music_album.to_json)
end

def save_books
  File.exist?('data/books.json') ? File.open('data/books.json', 'w') : File.new('data/books.json', 'w')
  File.write('data/books.json', Book.list_all_books.to_json)
end

def save_labels
  File.exist?('data/labels.json') ? File.open('data/labels.json', 'w') : File.new('data/labels.json', 'w')
  File.write('data/labels.json', Label.list_all_label.to_json)
end
