require_relative './spec_helper'

describe Classroom do
  before :each do
    @classroom = Classroom.new('classroom type')
  end

  context '#new' do
    it 'takes one parameters and returns a Classroom object' do
      expect(@classroom).to be_instance_of(Classroom)
    end
  end

  context '#label' do
    it 'returns the correct label' do
      expect(@classroom.label).to eq('classroom type')
    end
  end

  context '#students' do
    it 'returns an empty array just after initialization' do
      expect(@classroom.students).to eq([])
    end
  end
end

describe 'One-to-many relationship with Student class' do
  context 'when a student is added to a classroom' do
    it 'the student is added to the classroom\'s students array' do
      classroom = Classroom.new('classroom type')
      student = Student.new(nil, 15, 'student', true)
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end

    it 'the student\'s classroom attribute is set to the classroom' do
      classroom = Classroom.new('classroom type')
      student = Student.new(nil, 15, 'student', true)
      classroom.add_student(student)
      expect(student.classroom).to eq(classroom)
    end
  end
end
