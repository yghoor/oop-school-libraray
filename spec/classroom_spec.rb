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

