# frozen_string_literal: true

module Api
  module V1
    class ClientsController < ApplicationController
      before_action :set_client, only: %i[show payments]

      def index
        @clients = Client.all
        render json: ClientsSerializer.new(@clients)
      end

      def show
        render json: TransactionSerializer.new(@client.transactions.order(:status))
      end

      def payments
        render json: HeaderSerializer.new(@client.header)
      end

      private

      def set_client
        @client = Client.find(params[:id])
      end
    end
  end
end
