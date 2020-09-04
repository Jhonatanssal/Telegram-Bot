require_relative '../lib/methods.rb'

describe Methods do
  let(:method) { Methods.new }
  context 'valid' do
    let(:str) { 'time nowhere' }
    let(:str2) { 'time colombia' }
    let(:var) { method.valid(str) }
    let(:var2) { method.valid(str2) }

    it 'validates that the user input does not have a valid country' do
      expect(var).to be false
    end

    it 'validates that the user input does have a valid country' do
      expect(var2).to be_a Symbol
    end
  end

  context 'token' do
    it 'returns the token' do
      expect(method.token).to be_a String
    end
  end
end
