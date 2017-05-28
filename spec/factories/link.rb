FactoryGirl.define do
  factory :link do
    description FFaker::Lorem.phrase
    url FFaker::Internet.http_url
    company
  end
end
