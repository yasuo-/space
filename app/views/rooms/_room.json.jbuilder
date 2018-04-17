json.extract! room, :id, :home_type, :room_type, :summary, :address, :is_tv, :is_kitchen, :is_air, :is_heating, :is_internet, :accomodate, :bedroom, :bathroom, :sheet, :price, :active, :user_id, :listing_name, :latitude, :longitude, :created_at, :updated_at
json.url room_url(room, format: :json)
