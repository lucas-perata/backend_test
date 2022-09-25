class Client < ApplicationRecord
    has_many :transactions
    has_many :headers
    has_many :footers
end
