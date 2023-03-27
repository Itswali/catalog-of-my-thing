require 'securerandom'
require_relative 'label'
require_relative 'source'
require_relative 'genre'
require_relative 'author'

class Item
    def initialize (id = securerandom.uuid, genre, author, source, label, publish, archived, false)
        @id = id
        @genre = genre
        @author = author
        @source = source
        @label = label
        @publish = publish
        @archived = false 
    end

    def can_be_archived?
        return false unless publish < '2013-01-01'
        true
    end

    def move_to_archive
        if  can_be_archived?
            archived = true
    end
end