class Host::ReservationsController < Host::ApplicationController
  def reserved
    @listings = current_user.listings
  end
end
