require_relative './spec_helper'

describe Book do
  before :each do
    @book = Book.new('Title', 'Author')
  end

  context '#new' do
    it 'takes two parameters and returns a Book object' do
      expect(@book).to be_instance_of(Book)
    end
  end

  context '#title' do
    it 'returns the correct title' do
      expect(@book.title).to eq('Title')
    end
  end

  context '#author' do
    it 'returns the correct author' do
      expect(@book.author).to eq('Author')
    end
  end
end

