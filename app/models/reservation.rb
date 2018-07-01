class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  # scope :my_reserved, (listing_id, current_user_id) -> { where("listing_id = ? AND user_id = ?", listing_id, current_user_id) }
end
