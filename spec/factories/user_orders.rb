FactoryBot.define do
  factory :user_order do
    zip_number        { '111-1111' }
    dispatch_area_id  { 2 }
    city              { '北海道' }
    block_number      { '2' }
    phone_number      { '09012345678' }
    building_name     {'ああああああ'}
    token             { 'tok_abcdefghijk00000000000000000' }
  end
end
