# frozen_string_literal: true

class Client < ApplicationRecord
  has_many :transactions
  has_one :header
  has_one :footer
end
