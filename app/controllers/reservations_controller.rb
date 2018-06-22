class ReservationsController < ApplicationController
  layout 'host_application'
  # before_action :set_reservation, only: [:update, :destroy]

  def index
    @reservations = current_user.reservations.includes(:listing)
  end

  def new
    @listing = Listing.find(params[:listing_id])
    @user = current_user
    @start_date = params[:reservation][:start_date]
    @end_date = params[:reservation][:end_date]
    @price = params[:reservation][:price]
    @total_price = params[:reservation][:total_price]
  end

  # POST /reservations or POST /reservations.json
  def create
    @reservation = current_user.reservation.create(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation.listing, notice: '予約が完了しました.' }
        format.json { render :show, status: :created, location: @reservation.listing }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
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

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_reservation
  #  @reservation = Reservation.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def reservation_params
    params.require(:reservation).permit(:user_id, :room_id, :start_date, :end_date, :start_time, :end_time, :price, :total, :menu)
  end
end
