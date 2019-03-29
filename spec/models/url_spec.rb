require 'rails_helper'

RSpec.describe Url, type: :model do
  it { should validate_presence_of(:current_url) }

  it 'creates sanitized url from current url' do
    url = Url.new(current_url: 'https://google.com')
    url.sanitize_url!
    expect(url.sanitize_url).to eq('http://google.com')
  end

  it 'creates short url from current url' do
    url = Url.new(current_url: 'https://google.com')
    url.short_url!
    expect(url.short_url.length).to eq(6)
    expect(url.short_url).to eq('99999e')
  end
end
