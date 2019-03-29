FactoryBot.define do
  factory :url do
    url { Faker::Internet.url }
    visits { 0 }
  end
end
