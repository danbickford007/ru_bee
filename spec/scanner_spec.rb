require 'scanner'

describe String do

  let(:test_string_good) { "This is a test string. It doesn't have 123 any issues." }
  let(:test_string_bad) { "This is a test string. But it conaens a bad word." }


  describe '#correct?' do

    it 'should return true with correct word' do
      expect(test_string_good.correct?).to eq(true)
    end

    it 'should return false with incorrect word' do
      expect(test_string_bad.correct?).to eq(false)
    end

  end

  describe '#words' do

    it 'should break string into word parts' do
      expect(test_string_good.send('words').count).to eq(10)
    end

  end

  describe '#load_dictionary' do

    it 'should set DICTIONARY to' do
      test_string_good.correct?
      expect(test_string_good.send('dictionary').count).to eq(235887)
    end

  end

  describe '#remove_s' do

    it 'should trim plural to singluar with s' do
      expect(test_string_good.send('remove_s', 'tests')).to eq('test')
    end

  end

  describe '#remove_ed' do

    it 'should trim past with ed' do
      expect(test_string_good.send('remove_ed', 'tested')).to eq('test')
    end

  end

  describe '#remove_es' do

    it 'should trim past with es' do
      expect(test_string_good.send('remove_es', 'testes')).to eq('test')
    end

  end

  describe '#remove_ing' do

    it 'should trim past with ing' do
      expect(test_string_good.send('remove_ing', 'testing')).to eq('test')
    end

  end

end
