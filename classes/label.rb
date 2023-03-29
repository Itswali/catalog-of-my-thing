class Label
  attr_accessor :title, :color, :id, :items

  def initialize(title, color)
    @id = rand(1..100_00)
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
end
