class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations.includes(:listing)
  end

  def create
    @listing = Listing.find(params[:listing_id])
    if current_user == @listing.user
      old_selected_dates = []
      select_dates = params[:reservation][:selfReservedDates].split(',')
      reservations_by_self = @listing.reservations.where(user_id: current_user.id)
      reservations_by_self.each do |reservation|
        old_selected_dates.push(reservation.start_date)
      end

      old_selected_dates&.each do |date|
          @reservation = current_user.reservations.where(start_date: date, end_date: date)
          @reservation.destroy_all
        end

      select_dates&.each do |date|
          current_user.reservations.create(listing_id: @listing.id,
                                           start_date: date,
                                           end_date: date,
                                           self_booking: true)
        end

      redirect_back(fallback_location: root_path, notice: '予約が完了しました.')
    else
      @reservation = current_user.reservations.create(reservation_params)
      respond_to do |format|
        if @reservation.save
          format.html { redirect_back(fallback_location: root_path, notice: '予約が完了しました.') }
          format.json { render :show, status: :created, location: @reservation.listing }
        else
          render json: @reservation.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /reservations/1 or PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1 or DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def setdate
    listing = Listing.find(params[:listing_id])
    today = Time.zone.today
    reservations = listing.reservations.where("start_date >= ? OR end_date >= ?", today, today)

    render json: reservations
  end

  def duplicate
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])
    result = { duplicate: is_duplicate(start_date, end_date) }
    render json: result
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_reservation
  #  @reservation = Reservation.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def reservation_params
    params.require(:reservation).permit(:user_id,
                                        :listing_id,
                                        :start_date,
                                        :end_date,
                                        :price,
                                        :total_price,
                                        :menu)
  end

  def is_duplicate(start_date, end_date)
    listing =Listing.find(params[:listing_id])
    check = listing.reservations.where("? < start_date AND end_date < ?", start_date, end_date)
    check.size > 0
  end
end
