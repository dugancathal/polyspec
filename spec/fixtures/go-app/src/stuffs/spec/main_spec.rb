require 'rspec'
require 'httparty'

describe 'Main' do
  it 'works' do
    response = HTTParty.get('http://localhost:3000/')
    expect(response['foo']).to eq 'bar'
  end
end
