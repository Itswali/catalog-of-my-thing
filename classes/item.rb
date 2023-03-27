require 'securerandom'
require_relative 'label'
require_relative 'source'
require_relative 'genre'
require_relative 'author'

class Item
  attr_accessor :genre, :author, :label, :publish_date, :archived

  def initialize(genre, author, label, publish_date = date, archived: false)
    @id = SecureRandom.uuid
    @genre = genre
    @author = author
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    return false unless publish < '2013-01-01'

    true
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
