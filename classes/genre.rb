class Genre
  attr_accessor :id, :name, :items

  def initialize(name, id = rand(1..100_00))
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @item << item
    item.genre = self
  end

  def self.list_all_genre
    ObjectSpace.each_object(self).to_a
  end

  def self.create_genre(name)
    genre_obj = list_all_genre.find { |genre| genre.name == name }
    genre_obj.nil? ? new(name) : genre_obj
  end

  def to_json(*_option)
    {
      id: @id,
      name: @name
    }.to_json
  end

  def self.from_hash(genre)
    new(genre['name'], genre['id'])
  end

  def self.from_hash_array(array)
    array.each { |genre| from_hash(genre) }
  end
end
