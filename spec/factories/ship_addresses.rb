FactoryBot.define do
  factory :ship_address do
    postal_code      {'123-4567'}
    prefecture_id    {'2'}
    city             {'川越市'}
    address_detail   {'南大塚1-2-3'}
    apartment        {'ラピュタ102'}
    phone_number     {'09012345678'}

    association :user

  end
end