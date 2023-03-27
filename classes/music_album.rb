require 'securerandom'
require_relative 'item'

class Musicalbum < Item
  attr_accessor :on_spotify

  def initialize(genre, author, label, publish_date, on_spotify: false)
    super genre, author, label, publish_date

    @on_spotify = on_spotify
  end

  #   def can_be_archived?
  #   end
end
