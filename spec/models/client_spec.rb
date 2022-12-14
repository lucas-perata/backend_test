# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Client, type: :model do
  subject do
    described_class.new(client_id: 'Anything')
  end
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a clientId' do
    subject.client_id = nil
    expect(subject).to_not be_valid
  end
end
