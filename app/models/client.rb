class Client < ApplicationRecord
    has_many :transactions
    has_one :header 
end
