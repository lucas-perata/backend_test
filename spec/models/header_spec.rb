# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Header, :type => :model do
  let(:client) { Client.create(client_id: "Anything") }
  let(:footer) { Footer.create(client_id: client.id) }
  subject {
    described_class.new(client_id: client.id, footer_id: footer.id)
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.client_id = nil
    expect(subject).to_not be_valid
  end
end
