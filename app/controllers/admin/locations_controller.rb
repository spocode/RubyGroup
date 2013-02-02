class Admin::LocationsController < Admin::BaseController
  
  def index
    
  end
  
  def new
    @organization = Organization.find params[:organization_id]
    @location = @organization.locations.build
  end
  
  def create
    @organization.find params[:organization_id]
    @location = @organization.locations.build params[:location]
    if @location.save
      redirect_to @organization
    end
  end
  
  def edit
    @organization = Organization.find params[:organization_id]
    @location = @organization.locations.find params[:id]
  end
  
  def show
    @organization = Organization.find params[:organization_id]
    @location = @organization.locations.find params[:id]
  end
  
end