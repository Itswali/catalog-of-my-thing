require 'securerandom'
require_relative 'item'

class Genre
  attr_accessor :name, :id, :items

  def initialize(name, id = SecureRandom.uuid)
    @id = id
    @name = name
    @item = item []
  end

  def add_item; end
end
