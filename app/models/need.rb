class Need
  include Mongoid::Document
  field :name, type: String
  field :type, type: String
  embedded_in :organization
end
