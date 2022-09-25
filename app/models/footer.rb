# frozen_string_literal: true

class Footer < ApplicationRecord
  belongs_to :client
  has_one :header
  attribute :reserved, :string, default: '               '
  validates_presence_of :client_id
end
