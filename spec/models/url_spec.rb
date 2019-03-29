require 'rails_helper'

RSpec.describe Url, type: :model do
  it { should validate_presence_of(:current_url) }
  it { should validate_presence_of(:short_url) }
  it { should validate_presence_of(:sanitize_url) }
end
