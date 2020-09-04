require_relative '../lib/phrases.rb'

describe Phrases do
  let(:phrase) { Phrases.new }
  context 'phrases_list' do
    it 'creates an array with phrases' do
      expect(phrase.phrases_list).to be_an Array
    end
  end

  context 'select_phrase' do
    it 'select a phrase from phrases_list array' do
      expect(phrase.select_phrase).to be_a String
    end
  end
end
