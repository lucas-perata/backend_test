# frozen_string_literal: true

module Api
  module V1
    class ClientsController < ApplicationController
      before_action :set_client, only: %i[show payments]

      def index
        @clients = Client.all
        render json: @clients
      end

      def show
        render json: @client.transactions
      end

      def payments
        options = {
          include: [:header]
        }
        footer = @client.footer
        render json: footer.to_json(include: [:header])
      end

      private

      def set_client
        @client = Client.find(params[:id])
      end
    end
  end
end
