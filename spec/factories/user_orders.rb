FactoryBot.define do
  factory :user_order do
    zip_number        {'111-1111'}
    dispatch_area_id  { 2 }
    city              {'北海道'}
    block_number      { 2 }
    phone_number      { 2 }
    item_id           { 2 }
    user_id           { 2 }
  end
end
