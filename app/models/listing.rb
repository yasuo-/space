class Listing < ApplicationRecord
  belongs_to :user
  has_many :photos,       dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :reviews,      dependent: :destroy
  scope :actived, -> { where(active: true) }
  scope :near_location, -> (geolocation) { near(geolocation, 1, order: 'distance') }
  scope :order_desc_id, -> { order('id desc') }

  # validates :home_type, :listing_type, :accomodate, :bedroom, :bathroom, :listing_name, :summary, :address, presence: true
  validates :home_type, presence: true
  validates :listing_type, presence: true
  validates :listing_name, length: { maximum: 50 }
  validates :summary, length: { maximum: 250 }

  # geocode_by :address
  # after_validation :geocode, if: :address_changed?

  def average_star_rate
    if reviews.average(:rate).present?
      reviews.count == 0 ? 0 : reviews.average(:rate).round(1)
    else
      0
    end
  end
end
