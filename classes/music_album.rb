require_relative 'item'

class Musicalbum < Item
  attr_accessor :on_spotify

  def initialize(genre: nil, author: nil, label: nil, publish_date: nil, on_spotify: false)
    super(genre: genre, author: author, label: label, publish_date: publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end
end
