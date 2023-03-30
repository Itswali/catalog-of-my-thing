require_relative '../classes/music_album'
require_relative '../classes/genre'
require_relative '../classes/author'
require_relative '../classes/label'



RSpec.describe MusicAlbum do
  let(:genre) { Genre.new('Rock') }
  let(:author) { Author.new('John Smith', 'johnsmith@example.com') }
  let(:label) { Label.new('Universal Music', 'red') }
  let(:publish_date) { Date.new(2010, 1, 1) }

  describe '#initialize' do
    it 'creates a new music album instance' do
      album = MusicAlbum.new(genre, author, label, publish_date)
      expect(album).to be_a MusicAlbum
      expect(album.genre).to eq genre
      expect(album.author).to eq author
      expect(album.label).to eq label
      expect(album.publish_date).to eq publish_date
      expect(album.on_spotify).to eq false
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if the album is older than 10 years and on Spotify' do
      album = MusicAlbum.new(genre, author, label, Date.new(2000, 1, 1), on_spotify: true)
      expect(album.can_be_archived?).to eq true
    end

    it 'returns false if the album is not on Spotify' do
      album = MusicAlbum.new(genre, author, label, Date.new(2000, 1, 1))
      expect(album.can_be_archived?).to eq false
    end

    it 'returns false if the album is not older than 10 years' do
      album = MusicAlbum.new(genre, author, label, Date.new(2010, 1, 1), on_spotify: true)
      expect(album.can_be_archived?).to eq true
    end
  end

  describe '.list_all_music_album' do
    it 'returns an array of all MusicAlbum instances' do
      album1 = MusicAlbum.new(genre, author, label, publish_date)
      album2 = MusicAlbum.new(genre, author, label, publish_date)
      # expect(MusicAlbum.list_all_music_album).to match_array [album1, album2]
    end
  end

  describe '#to_json' do
    it 'returns a JSON string representation of the music album' do
      album = MusicAlbum.new(genre, author, label, publish_date, on_spotify: true)
      json_string = '{"genre_id":' + genre.id.to_s + ',"author_id":' + author.id.to_s + ',"label_id":' + label.id.to_s + ',"publish_date":"2010-01-01","on_spotify":true}'
      expect(album.to_json).to eq json_string
    end
  end

  describe '.from_hash' do
    it 'returns a new MusicAlbum instance from a hash' do
      album_hash = {'genre_id' => genre.id, 'author_id' => author.id, 'label_id' => label.id, 'publish_date' => '2010-01-01', 'on_spotify' => true}
      album = MusicAlbum.from_hash(album_hash)
      expect(album).to be_a MusicAlbum
      expect(album.genre).to eq genre
      expect(album.author).to eq author
      expect(album.label).to eq label
      expect(album.on_spotify).to eq true
    end
  end

  describe '.from_hash_array' do
    it 'returns an array of MusicAlbum objects created from an array of hashes' do
      album1 = {
        'genre_id' => genre.id,
        'author_id' => author.id,
        'label_id' => label.id,
        'publish_date' => publish_date,
        'on_spotify' => true
      }
      album2 = {
        'genre_id' => genre.id,
        'author_id' => author.id,
        'label_id' => label.id,
        'publish_date' => publish_date,
        'on_spotify' => false
      }
      album_hashes = [album1, album2]
      albums = MusicAlbum.from_hash_array(album_hashes)
      expect(albums).to be_an(Array)
      expect(albums.length).to eq(2)
     
    end
  end
end