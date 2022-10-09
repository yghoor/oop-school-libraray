describe Rental do
  before :each do
    @person = Person.new(25, 'person')
    @book = Book.new('Title', 'Author')
    @rental = Rental.new('YYYY/MM/DD', @person, @book)
  end

  context '#new' do
    it 'takes two parameters and returns a Rental object' do
      expect(@rental).to be_instance_of(Rental)
    end

    it 'adds the rental to the person\'s rentals' do
      expect(@person.rentals).to include(@rental)
    end

    it 'adds the rental to the book\'s rentals' do
      expect(@book.rentals).to include(@rental)
    end
  end

  context '#person' do
    it 'returns the correct person' do
      expect(@rental.person).to eq(@person)
    end
  end

  context '#book' do
    it 'returns the correct book' do
      expect(@rental.book).to eq(@book)
    end
  end
end