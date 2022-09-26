# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transaction, :type => :model do
  let(:client) { Client.create(client_id: "Anything") }
  subject {
    described_class.new(client_id: client.id, 
      transaction_id: "Anything")
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a client_id" do
    subject.client_id = nil
    subject.transaction_id = nil
    expect(subject).to_not be_valid
  end
end
