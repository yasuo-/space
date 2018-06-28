class Host::ReservationsController < ApplicationController
  layout 'host_application'

  def reserved
    @listings = current_user.listings
  end
end
