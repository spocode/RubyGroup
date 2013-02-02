class Admin::BaseController < ApplicationController
  
  layout "admin"
  
  before_filter :authenticate_user!
  before_filter :require_admin
  
  def require_admin
    redirect_to "/" unless !current_user || current_user.admin?
  end
  
end