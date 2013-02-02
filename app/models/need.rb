class Need
  include Mongoid::Document
  field :description, type: String
  field :type, type: String
  embedded_in :location
end
