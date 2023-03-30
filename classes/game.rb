require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(genre, author, label, publish_date, last_played_at)
    super genre, author, label, publish_date
    @multiplayer = false
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && ((Date.today.year - @last_played_at.year) > 2)
  end

  def self.list_all_games
    ObjectSpace.each_object(self).to_a
  end

  def to_json(*_option)
    {
      genre_id: @genre.id,
      author_id: @author.id,
      label_id: @label.id,
      publish_date: @publish_date,
      last_played_at: @last_played_at
    }.to_json
  end

  def self.from_hash(game)
    genre_obj = Genre.list_all_genre.find { |genre| genre.id == game['genre_id'] }
    label_obj = Label.list_all_label.find { |label| label.id == game['label_id'] }
    author_obj = Author.list_all_authors.find { |author| author.id == game['author_id'] }
    new(genre_obj, author_obj, label_obj, game['publish_date'], game['last_played_at'])
  end

  def self.from_hash_array(array)
    array.each { |game| from_hash(game) }
  end
end
