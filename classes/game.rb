require 'securerandom'
require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(genre, author, label, publish_date, _last_played_at)
    super genre, author, label, publish_date
    @multiplayer = multiplayer
    @last_played_at = date
  end
  # def can_be_archived?
  # end
end
