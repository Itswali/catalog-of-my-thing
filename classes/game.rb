require_relative 'item'
class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(genre, author, label, publish_date, last_played_at)
    super genre, author, label, publish_date
    @multiplayer = false
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && ((Date.today.year - @last_played_at.year) > 2)
  end

  def self.list_all_games
    ObjectSpace.each_object(self).to_a
  end
end
