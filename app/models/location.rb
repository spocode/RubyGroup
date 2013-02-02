class Location
  include Mongoid::Document
  field :name, type: String
  field :address_1, type: String
  field :address_2, type: String
  field :city, type: String
  field :state, type: String
  field :zip, type: String
  field :d_address_1, type: String
  field :d_address_2, type: String
  field :d_city, type: String
  field :d_state, type: String
  field :d_zip, type: String
  embedded_in :organization, class_name: "Organization", inverse_of: :locations
  embeds_many :needs
end
