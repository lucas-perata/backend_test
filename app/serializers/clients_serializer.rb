# frozen_string_literal: true

class ClientsSerializer
  include JSONAPI::Serializer
  attributes :client_id, :first_name, :last_name
end
