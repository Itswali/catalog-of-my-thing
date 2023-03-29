class Genre
  attr_accessor :id, :name, :items

  def initialize(name)
    @id = rand(1..100_00)
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
end