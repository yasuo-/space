class Host::RoomsController < ApplicationController
  layout 'host_application'
  before_action :set_host_room, only: [:show, :edit, :update, :destroy]

  # GET /host/rooms
  # GET /host/rooms.json
  def index
    @host_rooms = Room.all
  end

  # GET /host/rooms/1
  # GET /host/rooms/1.json
  def show
  end

  # GET /host/rooms/new
  def new
    @host_room = Room.new
  end

  # GET /host/rooms/1/edit
  def edit
  end

  # POST /host/rooms
  # POST /host/rooms.json
  def create
    @host_room = Room.new(host_room_params)

    respond_to do |format|
      if @host_room.save
        format.html { redirect_to @host_room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @host_room }
      else
        format.html { render :new }
        format.json { render json: @host_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /host/rooms/1
  # PATCH/PUT /host/rooms/1.json
  def update
    respond_to do |format|
      if @host_room.update(host_room_params)
        format.html { redirect_to @host_room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @host_room }
      else
        format.html { render :edit }
        format.json { render json: @host_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /host/rooms/1
  # DELETE /host/rooms/1.json
  def destroy
    @host_room.destroy
    respond_to do |format|
      format.html { redirect_to host_rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_host_room
    @host_room = Room.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def host_room_params
    params.fetch(:host_room, {})
  end
end
