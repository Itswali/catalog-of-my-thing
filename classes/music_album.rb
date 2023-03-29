require_relative 'item'

class Music_album < Item
  attr_accessor :on_spotify

  def initialize(genre, author, label, publish_date, on_spotify: false)
    super(genre, author, label, publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def self.list_all_music_album
    ObjectSpace.each_object(self).to_a
  end
end
