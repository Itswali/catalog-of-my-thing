require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(genre, author, label, publish_date, publisher)
    super(genre, author, label, publish_date)
    @publisher = publisher
    @cover_state = 'good'
  end

  def can_be_archived?
    super || cover_state == 'bad'
  end

  def self.list_all_books
    ObjectSpace.each_object(self).to_a
  end

  def to_json(*_option)
    {
      genre_id: @genre.id,
      author_id: @author.id,
      label_id: @label.id,
      publish_date: @publish_date,
      publisher: @publisher
    }.to_json
  end

  def self.from_hash(book)
    genre_obj = Genre.list_all_genre.find { |genre| genre.id == book['genre_id'] }
    label_obj = Label.list_all_label.find { |label| label.id == book['label_id'] }
    author_obj = Author.list_all_authors.find { |author| author.id == book['author_id'] }
    new(genre_obj, author_obj, label_obj, book['publish_date'], book['publisher'])
  end

  def self.from_hash_array(array)
    array.each { |book| from_hash(book) }
  end
end
