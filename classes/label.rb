class Label
  attr_accessor :title, :color, :id, :items

  def initialize(title, color, id = rand(1..100_00))
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def self.list_all_label
    ObjectSpace.each_object(self).to_a
  end

  def self.create_label(title, color)
    label_obj = list_all_label.find { |label| label.title == title && label.color == color }
    label_obj.nil? ? new(title, color) : label_obj
  end

  def to_json(*_option)
    {
      id: @id,
      title: @title,
      color: @color
    }.to_json
  end

  def self.from_hash(label)
    new(label['title'], label['color'], label['id'])
  end

  def self.from_hash_array(array)
    array.each { |label| from_hash(label) }
  end
end
