require 'scanner'

describe Suggestion do

  let(:suggestion) { Suggestion.new 'test', ["car", "dog", "tester", "dan", "testit"] }


  describe '#search' do

    it 'should return hash with word' do
      expect(suggestion.search[:word]).to eq('test')
    end

    it 'should return hash with suggestions array' do
      expect(suggestion.search[:suggestions][0]).to eq('tester')
      expect(suggestion.search[:suggestions][1]).to eq('testit')
    end

  end

  describe '#format' do
    
    it 'should return hash with word' do
      expect(suggestion.format([['tester'], ['here']])[:word]).to eq('test')
    end

  end

  describe '#suggestions' do
    
    it 'should return 2 results' do
      expect(suggestion.suggestions).to eq(['tester', 'testit'])
    end

  end

end
