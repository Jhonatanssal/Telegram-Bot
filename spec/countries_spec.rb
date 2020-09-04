require_relative '../lib/countries.rb'

describe TimeOutput do
  let(:country) { TimeOutput.new }
  context 'countries' do
    it 'creates a Hash with the countries name and the difference with the UTC time zone' do
      expect(country.countries).to be_a Hash
    end
  end
end
