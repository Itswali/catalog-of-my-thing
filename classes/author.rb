class Author
  attr_accessor :first_name, :last_name, :id, :items

  def initialize(first_name, last_name)
    @id = rand(1..100_00)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end

  def self.list_all_authors
    ObjectSpace.each_object(self).to_a
  end

  def self.create_author(first_name, last_name)
    author_obj = list_all_authors.find { |author| author.first_name == first_name && author.last_name == last_name }
    author_obj.nil? ? new(first_name, last_name) : author_obj
  end
end
