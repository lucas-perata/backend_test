# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Clients', type: :request do
  let(:client) { FactoryBot.create(:client) }
  let(:client_id) { client.id.to_s }
  let(:footer) { FactoryBot.create(:footer, client_id: client.id) }

  describe 'GET /index' do
    before do
      FactoryBot.create_list(:client, 10)
      get '/api/v1/clients'
    end

    it 'returns all clients' do
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /clients/:id' do
    before do
      FactoryBot.create_list(:transaction, 10, client_id: client.id)
      get "/api/v1/clients/#{client_id}"
    end

    it 'returns all transactions from one(1) client' do
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end

    context 'when the request is invalid' do
      before { get '/api/v1/clients/1' }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
      it 'returns a validation failure message' do
        expect(response.body)
          .to include('{"error":"not-found"}')
      end
    end
  end

  describe 'GET /clients/:id/payments' do
    before do
      FactoryBot.create(:header, client_id: client.id, footer_id: footer.id)
      get "/api/v1/clients/#{client_id}/payments"
    end

    it 'returns payment date and total amount from one(1) client' do
      expect(json.size).to eq(7)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end

    context 'when the request is invalid' do
      before { get '/api/v1/clients/1/payments' }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
      it 'returns a validation failure message' do
        expect(response.body)
          .to include('{"error":"not-found"}')
      end
    end
  end
end
