require 'securerandom'
require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(genre, author, label, publish_date, last_played_at)
    super genre, author, label, publish_date
    @multiplayer = false
    @last_played_at = last_played_at
  end
  # def can_be_archived?
  # end
end
