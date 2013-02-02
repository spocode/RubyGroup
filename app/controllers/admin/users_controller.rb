class Admin::UsersController < Admin::BaseController
  
  def index
    @users = User.all
  end
  
  def edit
    @user = User.find params[:id]
  end
  
  def update
    @user = User.find params[:id]
    if @user.update_attributes params[:user], as: :admin
      redirect_to admin_users_path
    end
  end
  
end
