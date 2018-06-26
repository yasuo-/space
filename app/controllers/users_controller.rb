class UsersController < ApplicationController
  layout 'host_application'
  def show
    @user = User.find(params[:id])
  end

  def edit

  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: '更新できました.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
