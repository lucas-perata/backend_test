# frozen_string_literal: true

class HeaderSerializer
  include JSONAPI::Serializer
  attributes :total, :discounts, :total_with_discounts
end
