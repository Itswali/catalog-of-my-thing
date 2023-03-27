require 'securerandom'
require_relative 'item'

class Game < Item
    def initialize(multiplayer, last_played_at)
        @multiplayer = multiplayer
        @last_played_at = date
    end

    def can_be_archived?
    end    
end