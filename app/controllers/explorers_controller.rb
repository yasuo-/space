class ExplorersController < ApplicationController
  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
    @photos = @listing.photos
    @current_user_booking = Reservation.where("listing_id = ? AND user_id = ?",@listing.id,current_user.id).present? if current_user
    @reviews = @listing.reviews#.order_desc_id
    @current_user_review = @reviews.find_by(user_id: current_user) if current_user
  end
end
