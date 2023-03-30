require_relative 'item'

class Music_album < Item
  attr_accessor :on_spotify

  def initialize(genre, author, label, publish_date, on_spotify: false)
    super(genre, author, label, publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def self.list_all_music_album
    ObjectSpace.each_object(self).to_a
  end

  def to_json(*_option)
    {
      genre_id: @genre.id,
      author_id: @author.id,
      label_id: @label.id,
      publish_date: @publish_date,
      on_spotify: @on_spotify
    }.to_json
  end

  def self.from_hash(album)
    genre_obj = Genre.list_all_genre.find { |genre| genre.id == album['genre_id'] }
    label_obj = Label.list_all_label.find { |label| label.id == album['label_id'] }
    author_obj = Author.list_all_authors.find { |author| author.id == album['author_id'] }
    new(genre_obj, author_obj, label_obj, album['publish_date'], on_spotify: album['on_spotify'])
  end

  def self.from_hash_array(array)
    array.each { |album| from_hash(album) }
  end
end
