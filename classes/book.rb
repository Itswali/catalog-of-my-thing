require 'securerandom'
require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(genre, author, label, publish_date, publisher)
    super genre, author, label, publish_date

    @publisher = publisher
    @cover_state = 'bad'
  end
  #   def can_be_archived?
  #   end
end
