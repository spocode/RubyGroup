class NeedsController < ApplicationController
  
  def new
    @organization = Organization.find params[:organization_id]
    @need = Need.new
  end
  
  def create
    @organization = Organization.find params[:organization_id]
    @need = @organization.needs.build params[:need]
    if @need.save
      redirect_to @organization
    end
  end
  
end