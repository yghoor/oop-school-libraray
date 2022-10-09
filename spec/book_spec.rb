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

describe 'One-to-many relationship with Rental class' do
  context 'when a rental is created' do
    it 'the rental is added to the book\'s rentals' do
      book = Book.new('Title', 'Author')
      person = Person.new(25, 'person')
      book.add_rental('YYYY/MM/DD', person)
      expect(book.rentals).to_not be_empty
    end
  end
end