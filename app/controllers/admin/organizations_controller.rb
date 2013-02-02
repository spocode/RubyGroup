class Admin::OrganizationsController < ApplicationController
  
  def index
    @organizations = Organization.all
  end
  
  def show
    @organization = Organization.find params[:id]
  end
  
  def new
    @organization = Organization.new
  end
  
end