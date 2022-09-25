# frozen_string_literal: true

class TransactionSerializer
  include JSONAPI::Serializer
  attributes :amount, :status
end
