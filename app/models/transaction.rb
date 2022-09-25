# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :client
  attribute :reserved, :string, default: '     '
  validates_presence_of :client_id
  validates_presence_of :transaction_id
end
