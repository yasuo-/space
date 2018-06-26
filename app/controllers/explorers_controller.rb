class ExplorersController < ApplicationController
  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
    @photos = @listing.photos
  end
end
