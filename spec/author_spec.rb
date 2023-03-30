require 'json'
require_relative '../classes/author'

RSpec.describe Author do
  describe '#initialize' do
    it 'sets the first name and last name of the author' do
      author = Author.new('John', 'Doe')
      expect(author.first_name).to eq 'John'
      expect(author.last_name).to eq 'Doe'
    end

    it 'sets a random id if no id is provided' do
      author1 = Author.new('John', 'Doe')
      author2 = Author.new('Jane', 'Doe')
      expect(author1.id).not_to eq author2.id
    end

    it 'sets the provided id if one is provided' do
      author = Author.new('John', 'Doe', 123)
      expect(author.id).to eq 123
    end

    it 'initializes the items array' do
      author = Author.new('John', 'Doe')
      expect(author.items).to eq []
    end
  end

  describe '.create_author' do
    it 'returns a new author if one with the same name does not exist' do
      author = Author.create_author('John', 'Doe')
      expect(author).to be_instance_of(Author)
      expect(author.first_name).to eq 'John'
      expect(author.last_name).to eq 'Doe'
    end
  end

  describe '#to_json' do
    it 'returns the author object in JSON format' do
      author = Author.new('John', 'Doe', 123)
      expect(author.to_json).to eq '{"id":123,"first_name":"John","last_name":"Doe"}'
    end
  end

  describe '.from_hash' do
    it 'returns a new author object from a hash' do
      hash = { 'id' => 123, 'first_name' => 'John', 'last_name' => 'Doe' }
      author = Author.from_hash(hash)
      expect(author).to be_instance_of(Author)
      expect(author.id).to eq 123
      expect(author.first_name).to eq 'John'
      expect(author.last_name).to eq 'Doe'
    end
  end
end
