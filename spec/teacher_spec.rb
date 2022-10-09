require_relative './spec_helper'

describe Teacher do
  before :each do
    @teacher = Teacher.new('specialization', 25, 'teacher')
  end

  context '#new' do
    it 'takes three parameters and returns a Teacher object' do
      expect(@teacher).to be_instance_of(Teacher)
    end

    it 'is a child of the Person class' do
      expect(@teacher).to be_kind_of(Person)
    end

    it 'applies default value for name parameter when 2 parameters are given' do
      teacher = Teacher.new('specialization', 25)
      expect(teacher.name).to eq('Unknown')
    end
  end

  context '#name' do
    it 'returns the correct name' do
      expect(@teacher.name).to eq('teacher')
    end 
  end

  context '#age' do
    it 'returns the correct age' do
      expect(@teacher.age).to eq(25)
    end
  end

  context '#id' do
    it 'returns a random id' do
      expect(@teacher.id).to be_between(1, 1000)
    end
  end
end

describe 'Teacher#can_use_services?' do
  context 'always returns true' do
    it 'when the Teacher is under 18' do
      under_18 = Teacher.new('specialization', 15, 'teacher')
      expect(under_18.can_use_services?).to be(true)
    end

    it 'when the Teacher is over 18' do
      over_18 = Teacher.new('specialization', 25, 'teacher')
      expect(over_18.can_use_services?).to be(true)
    end
  end
end

describe 'Teacher#validate_name' do
  it 'returns capitalized Teacher.name' do
    teacher = Teacher.new('specialization', 25, 'teacher')
    teacher.validate_name
    expect(teacher.name).to eq('Teacher')
  end

  it 'returns trimmed Teacher.name if it is longer than 10 characters' do
    teacher = Teacher.new('specialization', 25, 'Teacher untrimmed')
    teacher.validate_name
    expect(teacher.name).to eq('Teacher un')
  end

  it 'returns capitalized and trimmed Teacher.name' do
    teacher = Teacher.new('specialization', 25, 'teacher untrimmed')
    teacher.validate_name
    expect(teacher.name).to eq('Teacher un')
  end
end