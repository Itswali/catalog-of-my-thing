require_relative '../classes/item'
require_relative '../classes/game'
require_relative '../classes/genre'
require 'json'

describe Game do
  let(:genre) { Genre.new('Action', 'A game genre focused on physical challenges') }
  let(:author) { Author.new('John Doe', 'johndoe@example.com') }
  let(:label) { Label.new('Label 1', 'Blue') }
  let(:publish_date) { Date.new(2020, 1, 1) }
  let(:last_played_at) { Date.new(2022, 3, 1) }
  let(:game) { Game.new(genre, author, label, publish_date, last_played_at) }

  describe '#can_be_archived?' do
    context 'when the game was last played more than 2 years ago' do
      let(:last_played_at) { Date.new(2018, 1, 1) }

      it 'returns true' do
        expect(game.can_be_archived?).to eq false
      end
    end

    context 'when the game was last played less than 2 years ago' do
      let(:last_played_at) { Date.new(2021, 1, 1) }

      it 'returns false' do
        expect(game.can_be_archived?).to eq false
      end
    end
  end

  describe '.to_json' do
    it 'returns the game object as a JSON string' do
      expect(game.to_json).to eq({
        genre_id: genre.id,
        author_id: author.id,
        label_id: label.id,
        publish_date: publish_date,
        last_played_at: last_played_at
      }.to_json)
    end
  end

  describe '.from_hash' do
    let(:json_string) { game.to_json }
    let(:hash) { JSON.parse(json_string) }

    it 'returns a new game object from the hash' do
      expect(Game.from_hash(hash)).to be_a(Game)
      expect(Game.from_hash(hash).genre).to eq(genre)
      expect(Game.from_hash(hash).author).to eq(author)
      expect(Game.from_hash(hash).label).to eq(label)
    end
  end

  describe '.from_hash_array' do
    let(:json_string) { game.to_json }
    let(:hash_array) { [JSON.parse(json_string)] }

    it 'creates new game objects from an array of hashes' do
      expect(Game.from_hash_array(hash_array)).to be_a(Array)
      expect(Game.from_hash_array(hash_array).length).to eq(1)
    end
  end
end
