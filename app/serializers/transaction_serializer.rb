# frozen_string_literal: true

class TransactionSerializer
  include JSONAPI::Serializer
  attributes :transaction_id, :amount, :status
end
