require 'securerandom'
require_relative 'item'

class Label
  attr_accessor :title, :color, :id, :items

  def initialize(title, color, id = SecureRandom.uuid)
    @id = id
    @title = title
    @color = color
    @item = item []
  end
  #   def add_item
  #   end
end
