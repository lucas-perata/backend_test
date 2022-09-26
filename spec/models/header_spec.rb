# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Header, type: :model do
  let(:client) { Client.create(client_id: 'Anything') }
  let(:footer) { Footer.create(client_id: client.id) }
  subject do
    described_class.new(client_id: client.id, footer_id: footer.id)
  end
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a client_id' do
    subject.client_id = nil
    expect(subject).to_not be_valid
  end
end
