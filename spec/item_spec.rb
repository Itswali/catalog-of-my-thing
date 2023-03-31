require_relative '../classes/item'

describe Item do
  let(:genre) { Genre.new('Fiction') }
  let(:author) { 'J.K. Rowling' }
  let(:label) { 'Harry Potter and the Philosopher\'s Stone' }
  let(:publish_date) { Date.parse('1997-06-26') }

  describe '#initialize' do
    it 'creates a new item with specified genre, author, label, and publish date' do
      item = Item.new(genre, author, label, publish_date)

      expect(item.genre).to eq(genre)
      expect(item.author).to eq(author)
      expect(item.label).to eq(label)
      expect(item.publish_date).to eq(publish_date)
    end
  end

  describe '#move_to_archive' do
    context 'when the item can be archived' do
      it 'sets the archived attribute to true' do
        item = Item.new(genre, author, label, Date.parse('2000-06-26'))

        item.move_to_archive
      end
    end

    context 'when the item cannot be archived' do
      it 'leaves the archived attribute as false' do
        item = Item.new(genre, author, label, Date.parse('2019-06-26'))

        item.move_to_archive
      end
    end
  end
end
