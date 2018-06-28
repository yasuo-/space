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
    else
      @listings = Listing.where(active: true).all
      @latitude = @listings.to_a[0].latitude
      @longitude = @listings.to_a[0].longitude
    end
  end
end
