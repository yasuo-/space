class PagesController < ApplicationController
  def index
    @listing = Listing.all
  end

  def show
  end
end
