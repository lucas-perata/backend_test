# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:client) { Client.create(client_id: 'Anything') }
  subject do
    described_class.new(client_id: client.id,
                        transaction_id: 'Anything')
  end
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a client_id' do
    subject.client_id = nil
    subject.transaction_id = nil
    expect(subject).to_not be_valid
  end
end
