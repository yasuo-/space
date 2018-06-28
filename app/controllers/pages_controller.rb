class PagesController < ApplicationController
  def index
    @listing = Listing.all
  end

  def show
  end

  def search
  end
end
