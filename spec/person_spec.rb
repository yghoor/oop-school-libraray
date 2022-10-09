require_relative './spec_helper'

describe Person do
  before :each do
    @person = Person.new(15, 'person', true)
  end

  context '#new' do
    it 'takes three parameters and returns a Person object' do
      expect(@person).to be_instance_of(Person)
    end

    it 'applies default value for name parameter when 1 parameter is given' do
      person = Person.new(15)
      expect(person.name).to eq('Unknown')
    end
  end

  context '#name' do
    it 'returns the correct name' do
      expect(@person.name).to eq('person')
    end 
  end

  context '#age' do
    it 'returns the correct age' do
      expect(@person.age).to eq(15)
    end
  end

  context '#id' do
    it 'returns a random id' do
      expect(@person.id).to be_between(1, 1000)
    end
  end
end

describe 'Person#can_use_services?' do
  context 'returns true' do
    it 'when the person is under 18 and has permission' do
      under_18 = Person.new(12, 'person', true)
      expect(under_18.can_use_services?).to be(true)
    end

    it 'when the person is over 18 and does not have permission' do
      over_18 = Person.new(25, 'person', false)
      expect(over_18.can_use_services?).to be(true)
    end

    it 'when the person is over 18 and has permission' do
      over_18 = Person.new(25, 'person', true)
      expect(over_18.can_use_services?).to be(true)
    end
  end

  context 'returns false' do
    it 'when the person is under 18 and does not have permission' do
      under_18 = Person.new(12, 'person', false)
      expect(under_18.can_use_services?).to be(false)
    end
  end
end

describe 'Person#validate_name' do
  it 'can return capitalized person.name' do
    person = Person.new(25, 'person', true)
    person.validate_name
    expect(person.name).to eq('Person')
  end

  it 'can return trimmed person.name if it is longer than 10 characters' do
    person = Person.new(25, 'Person untrimmed', true)
    person.validate_name
    expect(person.name).to eq('Person unt')
  end

  it 'can return capitalized and trimmed person.name' do
    person = Person.new(25, 'person untrimmed', true)
    person.validate_name
    expect(person.name).to eq('Person unt')
  end
end

describe 'One-to-many relationship with Rental class' do
  context 'when a rental is created' do
    it 'the rental is added to the person\'s rentals' do
      book = Book.new('Title', 'Author')
      person = Person.new(25, 'person')
      person.add_rental('YYYY/MM/DD', book)
      expect(person.rentals).to_not be_empty
    end
  end
end