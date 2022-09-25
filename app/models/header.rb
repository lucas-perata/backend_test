# frozen_string_literal: true

class Header < ApplicationRecord
  belongs_to :client
  belongs_to :footer
  attribute :reserved, :string, default: '   '
  validates_presence_of :client_id
end
