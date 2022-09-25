# frozen_string_literal: true

class Header < ApplicationRecord
  belongs_to :client
  attribute :reserved, :string, default: '   '
end
