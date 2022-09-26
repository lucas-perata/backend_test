# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :client do
    client_id { '939dc31b1a294463ab8856104c03d632' }
  end
end

FactoryBot.define do
  factory :transaction do
    client_id {}
    transaction_id { '8f6b80f30f9d4bbda8135f050892f679' }
  end
end

FactoryBot.define do
  factory :footer do
    client_id {}
  end
end

FactoryBot.define do
  factory :header do
    client_id {}
    footer_id {}
  end
end
