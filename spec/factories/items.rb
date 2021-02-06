FactoryBot.define do
  factory :item do
    name                  {Faker::Name.name}
    explanation           {Faker::Lorem.characters(number: 10)}
    category_id           { 2 }
    status_id             { 2 }
    shipping_charge_id    { 2 }
    dispatch_area_id      { 2 }
    shipping_duration_id  { 2 }
    price                 { 1000 }
    association :user 
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end