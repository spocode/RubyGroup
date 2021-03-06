class Admin::OrganizationsController < Admin::BaseController
  
  def index
    @organizations = Organization.users_organizations( current_user )
  end
  
  def show
    @organization = Organization.find params[:id]
    redirect_to "/admin" unless can_edit_org( @organization )
    # Temporarily test email
    @user = User.first
    UserMailer.welcome_email(@user).deliver
    flash[:notice] = "Sent test email to #{@user.email}."
  end
  
  def new
    @organization = Organization.new
  end
  
  def create
    @organization = Organization.new( params[:organization] )
    if @organization.save
      redirect_to admin_organizations_path
    end
  end
  
  def edit
    @organization = Organization.find params[:id]
  end
  
  def update
    @organization = Organization.find params[:id]
    if @organization.update_attributes( params[:organization] )
      # Temporarily test email
      @user = User.new(:email => @organization.volunteer_coordinator_email,
        :name => @organization.volunteer_coordinator_name)
      UserMailer.welcome_email(@user).deliver
      flash[:notice] = "Sent test email to #{@user.email}."
      redirect_to admin_organizations_path
    end
  end
  
  private
  
  def can_edit_org( org )
    current_user.admin? || current_user.organizations.include?( org )
  end
  
end