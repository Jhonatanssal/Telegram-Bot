require_relative '../lib/countries.rb'

describe Time_Output do
  let(:country) { Time_Output.new }
  context 'countries' do
    it 'creates a Hash with the countries name and the difference with the UTC time zone' do
      expect(country.countries).to be_a Hash
    end
  end
end
