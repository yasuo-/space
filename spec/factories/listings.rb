FactoryBot.define do
  factory :listing do
    home_type "MyString"
    listing_type "MyString"
    summary "MyText"
    address "MyString"
    is_tv false
    is_kitchen false
    is_air false
    is_heating false
    is_internet false
    accomodate 1
    bedroom 1
    bathroom 1
    sheet 1
    price 1
    active false
    user_id 1
    listing_name "MyString"
    latitude 1.5
    longitude 1.5
  end
end
