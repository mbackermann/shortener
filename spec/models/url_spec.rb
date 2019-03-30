require 'rails_helper'

RSpec.describe Url, type: :model do
  it { should validate_presence_of(:url) }
  it { should allow_value("https://google.com").for(:url) }
  it { should_not allow_value("foo").for(:url) }

  it 'creates sanitized url from url' do
    url = Url.new(url: 'https://google.com')
    url.sanitize_url!
    expect(url.sanitize_url).to eq('http://google.com')
  end

  it 'creates short url from url' do
    url = Url.new(url: 'https://google.com')
    url.short_url!
    expect(url.short_url.length).to eq(6)
    expect(url.short_url).to match(/[A-z0-9]{6}/)
  end

  it 'increases by 1 visits counter when visited' do
    url = Url.new(url: 'https://google.com')
    url.visited!
    expect(url.visits).to eq(1)
  end
end
