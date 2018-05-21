json.extract! listing, :id, :home_type, :listing_type, :summary, :address, :is_tv, :is_kitchen, :is_air, :is_heating, :is_internet, :accomodate, :bedroom, :bathroom, :sheet, :price, :active, :user_id, :listing_name, :latitude, :longitude, :created_at, :updated_at
json.url listing_url(listing, format: :json)
