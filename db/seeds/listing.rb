
100.times do |index|
  listing = Listing.new(
    home_type: "home",
    listing_type: "",
    summary: Faker::Lorem.sentence,
    address: Faker::Address.full_address,
    is_tv: false,
    is_kitchen: false,
    is_air: true,
    is_heating: false,
    is_internet: true,
    accomodate: index,
    bedroom: index,
    bathroom: 2,
    sheet: 2,
    price: "#{index}0000".to_i,
    active: true,
    user_id: index,
    listing_name: "listing name #{index}", 
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude
    )
  listing.save!
end