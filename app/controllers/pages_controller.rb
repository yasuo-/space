class PagesController < ApplicationController
  def index
    @listing = Listing.all
  end

  def show
  end

  def search
    if params[:search].present?
      @latitude = params["lat"]
      @longitude = params["lng"]
      geolocation = [@latitude, @longitude]
      @listings = Listing.actived.near(geolocation, 1, order: 'distance')#.near_location(geolocation)
    else
      @listings = Listing.actived.all
      @latitude = @listings.to_a[0].latitude
      @longitude = @listings.to_a[0].longitude
    end
  end
end
