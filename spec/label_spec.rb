require './classes/label'
require 'date'

describe Label do
  context 'Label class tests' do
    it 'should create an instance of Label class' do
      label = Label.new('label', 'red', [])
      expect(label).to be_an_instance_of(Label)
    end

    it 'should have a title' do
      label = Label.new('label', 'red', [])
      expect(label.title).to eq('label')
    end

    it 'should have a color' do
      label = Label.new('label', 'red', [])
      expect(label.color).to eq('red')
    end

    it 'should have an array of items' do
      label = Label.new('label', 'red', [])
      expect(label.items).to be_an_instance_of(Array)
    end

  end
end
