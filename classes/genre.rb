require 'securerandom'
require_relative 'item'

class Genre
    def initialize (id = securerandom.uuid, name)
        @id = id
        @name = name
        @item = item []
    end

    def add_item
    end
end