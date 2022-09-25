# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Client, :type => :model do
  subject {
    described_class.new(client_id: "Anything")
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.client_id = nil
    expect(subject).to_not be_valid
  end
end