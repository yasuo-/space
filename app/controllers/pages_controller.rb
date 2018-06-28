class PagesController < ApplicationController
  def index
    @listing = Listing.all
  end

  def show
  end

  def search
    if params[:search].present?
      @latitude = latitude(params["lat"], params[:search])
      @longitude = longitude(params["lng"], params[:search])
      geolocation = [@latitude, @longitude]
      @listings = Listing.actived.near_location(geolocation)
    else
      @listings = Listing.actived.all
      @latitude = @listings.to_a[0].latitude
      @longitude = @listings.to_a[0].longitude
    end
  end

  private

  def latitude(lat, search_name)
    return lat if lat.present?
    locations = Geocoder.coordinates(search_name)
    locations[0]
  end

  def longitude(lng, search_name)
    return lng if lng.present?
    locations = Geocoder.coordinates(search_name)
    locations[1]
  end
end
