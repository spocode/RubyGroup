class Organization
  include Mongoid::Document
  field :name, type: String
  field :volunteer_coordinator_name, type: String
  field :volunteer_coordinator_email, type: String
  has_and_belongs_to_many :users
  embeds_many :needs
  embeds_many :locations
  
  def self.users_organizations( user )
    if user.admin?
      all
    else
      user.organizations
    end
  end
  
end
