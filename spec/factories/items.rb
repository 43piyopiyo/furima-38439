FactoryBot.define do
  factory :item do
    name               {'コップ'}
    detail             {'これはコップです'}
    category_id        {'2'}
    condition_id       {'2'}
    delivery_free_id   {'2'}
    prefecture_id      {'2'}
    shipping_day_id    {'2'}
    price              {'1000'}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
  end
end