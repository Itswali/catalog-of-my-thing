require 'securerandom'
require_relative 'item'

class Author
  def initialize(_first_name, last_name, id = securerandom.uuid)
    @id = id
    @firs_name = firs_name
    @last_name = last_name
    @item = item []
  end

  #   def add_item
  #   end
end
