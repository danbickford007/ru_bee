require 'scanner'

describe String do

  let(:test_string_good) { "This is a test string. It doesn't have 123 any issues." }
  let(:test_string_bad) { "This is a test string. But it conaens a bad word. bergerb" }


  describe '#correct?' do

    it 'should return true with correct word' do
      expect(test_string_good.correct?).to eq(true)
    end

    it 'should return false with incorrect word' do
      expect(test_string_bad.correct?).to eq(false)
    end

  end

  describe '#misspellings' do

    it 'should return array of misspelled words' do
      expect(test_string_bad.misspellings).to eq(['conaens', 'bergerb'])
    end

    it 'should return array length of 2' do
      expect(test_string_bad.misspellings.count).to eq(2)
    end

    it 'should return array empty array if all correct' do
      expect(test_string_good.misspellings.count).to eq(0)
    end

    it 'should return suggestions if optioned' do
      suggestions = test_string_bad.misspellings(suggestions: true)
      expect(suggestions[0][:suggestions]).to eq([])
      answer = %w{berger brauneberger coberger johannisberger scharlachberger steinberger weinbergerite habergeon hauberget ramberge}
      expect(suggestions[1][:suggestions]).to eq(answer)
    end

  end


  describe '#words' do

    it 'should break string into word parts' do
      expect(test_string_good.send('words').count).to eq(10)
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
