FactoryBot.define do
  factory :user do
    nickname              {'サンプル'}
    email                 {'sample@gmail.com'}
    password              {'aaa000'}
    password_confirmation {password}
    last_name             {'鈴木'}
    first_name            {'花子'}
    ruby_last_name        {'スズキ'}
    ruby_first_name       {'ハナコ'}
    birthday              {'2000-01-01'}
  end
end