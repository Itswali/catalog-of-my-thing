require 'securerandom'
require_relative 'item'

class Label 
    def initialize (id = securerandom.uuid, title, color)
        @id = id
        @title = title
        @color = color
        @item = item []
    end

    def add_item
    end
end