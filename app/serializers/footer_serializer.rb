# frozen_string_literal: true

class FooterSerializer
  include JSONAPI::Serializer
  attributes :payment_date
  has_one :header
end
