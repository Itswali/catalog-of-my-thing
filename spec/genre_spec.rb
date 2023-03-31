require_relative '../classes/genre'

describe Genre do
  let(:genre_name) { 'Action' }
  let(:genre) { Genre.new(genre_name) }

  describe '#initialize' do
    it 'creates a new genre object with a random id and name' do
      expect(genre.id).to be_a(Integer)
      expect(genre.name).to eq(genre_name)
      expect(genre.items).to be_empty
    end
  end

  describe '.list_all_genre' do
    it 'returns an array of all genre objects' do
      expect(Genre.list_all_genre).to be_an(Array)
    end
  end

  describe '.create_genre' do
    it 'creates a new genre object if it does not already exist' do
      new_genre_name = 'Horror'
      new_genre = Genre.create_genre(new_genre_name)
      expect(new_genre).to be_a(Genre)
      expect(new_genre.name).to eq(new_genre_name)
      expect(Genre.list_all_genre).to include(new_genre)
    end
  end
  describe '#to_json' do
    it 'returns a JSON string representation of the genre object' do
      json_str = genre.to_json
      expect(json_str).to be_a(String)
      expect(json_str).to include(genre_name)
      expect(json_str).to include(genre.id.to_s)
    end
  end

  describe '.from_hash' do
    let(:genre_hash) { { 'id' => 1, 'name' => genre_name } }

    it 'creates a new genre object from a hash' do
      new_genre = Genre.from_hash(genre_hash)
      expect(new_genre).to be_a(Genre)
      expect(new_genre.name).to eq(genre_name)
      expect(new_genre.id).to eq(1)
    end
  end

  describe '.from_hash_array' do
    let(:genre_hashes) { [{ 'id' => 1, 'name' => genre_name }] }

    it 'creates an array of genre objects from an array of hashes' do
      genres = Genre.from_hash_array(genre_hashes)
      expect(genres).to be_an(Array)
    end
  end
end
