require_relative './spec_helper'

describe Corrector do
  before :each do
    @corrector = Corrector.new
  end

  context '#new' do
    it 'returns a Corrector object' do
      expect(@corrector).to be_instance_of(Corrector)
    end
  end

  context '#correct_name' do
    it 'takes a string as a parameter and returns it capitalized' do
      expect(@corrector.correct_name('string')).to eq('String')
    end

    it 'takes a string as a parameter and it can trim it if it is longer than 10 characters' do
      expect(@corrector.correct_name('Elevenchars')).to eq('Elevenchar')
    end

    it 'takes a string as a parameter and it can capitalize and trim it' do
      expect(@corrector.correct_name('elevenchars')).to eq('Elevenchar')
    end
  end
end