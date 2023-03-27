require 'securerandom'
require_relative 'item'

class Movie < Item
    def initialize(silet)
        @silet = false
    end

    def can_be_archived?
    end    
end