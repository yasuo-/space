class Host::UsersController < ApplicationController
  layout 'host_application'
  before_action :set_host_user, only: [:show, :edit, :update, :destroy]

  # GET /host/users
  # GET /host/users.json
  def index
    @host_users = User.all
  end

  # GET /host/users/1
  # GET /host/users/1.json
  def show
  end

  # GET /host/users/new
  def new
    @host_user = User.new
  end

  # GET /host/users/1/edit
  def edit
  end

  # POST /host/users
  # POST /host/users.json
  def create
    @host_user = User.new(host_user_params)

    respond_to do |format|
      if @host_user.save
        format.html { redirect_to @host_user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @host_user }
      else
        format.html { render :new }
        format.json { render json: @host_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /host/users/1
  # PATCH/PUT /host/users/1.json
  def update
    respond_to do |format|
      if @host_user.update(host_user_params)
        format.html { redirect_to @host_user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @host_user }
      else
        format.html { render :edit }
        format.json { render json: @host_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /host/users/1
  # DELETE /host/users/1.json
  def destroy
    @host_user.destroy
    respond_to do |format|
      format.html { redirect_to host_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_host_user
    @host_user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def host_user_params
    params.fetch(:host_user, {})
  end
end
