class Organization
  include Mongoid::Document
  field :name, type: String
  field :volunteer_coordinator_name, type: String
  field :volunteer_coordinator_email, type: String
  has_many :users
  embeds_many :locations, class_name: "Location", inverse_of: "organization"
  accepts_nested_attributes_for :locations
end
