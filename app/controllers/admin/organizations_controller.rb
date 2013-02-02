class Admin::OrganizationsController < Admin::BaseController
  
  def index
    @organizations = Organization.all
  end
  
  def show
    @organization = Organization.find params[:id]
  end
  
  def new
    @organization = Organization.new
  end
  
  def create
    @organization = Organization.new( params[:organization] )
    if @organization.save
      redirect_to admin_organizations_path
      # Temporarily test email
      @user = User.first
      UserMailer.welcome_email(@user).deliver
      flash[:notice] = "Sent test email to #{@user.email}"
    end
  end
  
  def edit
    @organization = Organization.find params[:id]
  end
  
  def update
    @organization = Organization.find params[:id]
    if @organization.update_attributes( params[:organization] )
      redirect_to admin_organizations_path
    end
  end
  
end