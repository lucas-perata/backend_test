# frozen_string_literal: true

class HeaderSerializer
  include JSONAPI::Serializer
  attributes :total, :discounts, :total_with_discounts
  belongs_to :footer, serializer: FooterSerializer
  belongs_to :client, serializer: ClientsSerializer
end
