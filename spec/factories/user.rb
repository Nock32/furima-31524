FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number:2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {Faker::Name.last_name}
    first_name            {Faker::Name.first_name}
    family_name_kana      {Faker::Name.last_name}
    first_name_kana       {Faker::Name.first_name}
    birthday              {Faker::Date.birthday}
  end
end