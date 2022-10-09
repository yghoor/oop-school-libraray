require_relative './spec_helper'

describe Student do
  before :each do
    @classroom = Classroom.new('classroom type')
    @student = Student.new(@classroom, 15, 'student', false)
  end

  context '#new' do
    it 'takes three parameters and returns a Student object' do
      expect(@student).to be_instance_of(Student)
    end

    it 'applies default value for name parameter when 2 parameters are given' do
      student = Student.new(@classroom, 15)
      expect(student.name).to eq('Unknown')
    end
  end

  context '#name' do
    it 'returns the correct name' do
      expect(@student.name).to eq('student')
    end 
  end

  context '#age' do
    it 'returns the correct age' do
      expect(@student.age).to eq(15)
    end
  end

  context '#id' do
    it 'returns a random id' do
      expect(@student.id).to be_between(1, 1000)
    end
  end
end

describe 'student#can_use_services?' do
  context 'returns true' do
    it 'when the Student is under 18 and has permission' do
      under_18 = Student.new(@classroom, 15, 'student', true)
      expect(under_18.can_use_services?).to be(true)
    end

    it 'when the Student is over 18 and does not have permission' do
      over_18 = Student.new(@classroom, 25, 'student', false)
      expect(over_18.can_use_services?).to be(true)
    end

    it 'when the Student is over 18 and has permission' do
      over_18 = Student.new(@classroom, 25, 'student', true)
      expect(over_18.can_use_services?).to be(true)
    end
  end

  context 'returns false' do
    it 'when the Student is under 18 and does not have permission' do
      under_18 = Student.new(@classroom, 12, 'student', false)
      expect(under_18.can_use_services?).to be(false)
    end
  end
end

describe 'student#validate_name' do
  it 'can return capitalized Student.name' do
    student = Student.new(@classroom, 25, 'student', true)
    student.validate_name
    expect(student.name).to eq('Student')
  end

  it 'can return trimmed Student.name if it is longer than 10 characters' do
    student = Student.new(@classroom, 25, 'Student untrimmed', true)
    student.validate_name
    expect(student.name).to eq('Student un')
  end

  it 'can return capitalized and trimmed Student.name' do
    student = Student.new(@classroom, 25, 'student untrimmed', true)
    student.validate_name
    expect(student.name).to eq('Student un')
  end
end

