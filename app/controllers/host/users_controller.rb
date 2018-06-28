class Host::UsersController < Host::ApplicationController  
  def show
    @user = User.find(params[:id])
  end
end
