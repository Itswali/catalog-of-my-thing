class Item
  attr_accessor :genre, :author, :label, :publish_date

  def initialize(genre, author, label, publish_date)
    @id = rand(1..100_00)
    @genre = genre
    @author = author
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def move_to_archive()
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    (Time.now.year - @publish_date.year) > 10
  end
end
