# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :client
  attribute :reserved, :string, default: '     '
end
