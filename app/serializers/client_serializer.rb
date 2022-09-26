# frozen_string_literal: true

class ClientSerializer 
  include JSONAPI::Serializer
  has_one :header 
  has_one :footer
  attributes :client_id, :first_name, :last_name, :email, :job, :phone, :address, :zip_code
end
