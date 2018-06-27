class ListingsController < ApplicationController
  layout 'host_application'
  before_action :authenticate_user!
  before_action :set_listing, only: [:show, :edit, :update, :destroy, :basics, :summary, :address, :price,
                                     :photos, :calendar, :facility, :bankaccount, :publish, :map]
  before_action :access_deny, only: [:basics, :summary, :address, :price, :photos, :calendar, :facility, :publish, :map]

  # GET /listings or /listings.json
  def index
    @listings = current_user.listings
  end

  # GET /listings/:id or GET /listings/:id.json
  def show
    @photos = @listing.photos
  end

  # GET /listings/new
  def new
    @listing = current_user.listings.build
  end

  # GET /listings/:id/edit
  def edit
  end

  # POST /listings or POST /listings.json
  def create
    @listing = current_user.listings.build(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'リスティングを作成・保存をしました.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { redirect_to new_listing_path, notice: 'リスティングを作成・保存出来ませんでした' } # render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/:id or /listings/:id.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: '更新できました.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/:id or /listings/:id.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'リスティングを削除しました.' }
      format.json { head :no_content }
    end
  end

  def basics
  end

  def summary
  end

  def address
  end

  def price
  end

  def facility
  end

  def photos
    @photo = Photo.new
  end

  def calendar
  end

  def map
  end

  def publish
  end

  def bankaccount
    @user = @listing.user
    session[:listing_id] = @listing.id
  end

  def not_checked
    @listing = Listing.find(params[:listing_id])
    @listing.update(not_checked: params[:not_checked])
    render :nothing => true
  end

  private

  def access_deny
    if !(current_user == @listing.user)
      redirect_to root_path, notice: '他人の編集ページにはアクセスできません'
    end
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:home_type,
                                    :listing_type,
                                    :summary,
                                    :address,
                                    :is_tv,
                                    :is_kitchen,
                                    :is_air,
                                    :is_heating,
                                    :is_internet,
                                    :accomodate,
                                    :bedroom,
                                    :bathroom,
                                    :sheet,
                                    :price,
                                    :active,
                                    :user_id,
                                    :listing_name,
                                    :latitude,
                                    :longitude,
                                    :active)
  end
end
