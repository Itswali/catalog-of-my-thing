require 'securerandom'
require_relative 'item'

class Musicalbum < Item
    def initialize(on_spotify)
        @on_spotify = false
    end

    def can_be_archived?
    end    
end