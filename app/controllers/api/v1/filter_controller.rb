# frozen_string_literal: true

module Api
  module V1
    class FilterController < ApplicationController
      require 'faker'
      def index
        response = HTTParty.get('https://increase-transactions.herokuapp.com/file.txt',
                                headers: { 'Authorization' => ENV['API_KEY'] })
        response_body = response.body
        response_string = response_body
        r = response_string.lines
        n = r.count
        b = 0

        while n > b
          # Clients filter
          filter_line = r[n - 1]

          if r[n - 1][0].to_i === 4
            new_client(filter_line[24..55])
            new_footer(filter_line[16..23])
          # Header Filter
          elsif r[n - 1][0].to_i === 2
            new_transaction(filter_line[1..32], filter_line[33..46], filter_line[51])
          elsif r[n - 1][0].to_i === 1
            new_header(filter_line[1..32], filter_line[35..38], filter_line[39..51], filter_line[52..64],
                       filter_line[65..78])
          else
            puts 'Table'
          end
          n -= 1
        end
      end

      def new_client(id)
        Client.create(client_id: id, first_name: Faker::Name.name, last_name: Faker::Name.name)
      end

      def new_transaction(id, amount, type)
        Transaction.create(transaction_id: id, amount: amount, status: type, client_id: Client.last.id)
      end

      def new_header(id, currency, total, discounts, total_with_discounts)
        Header.create(client_id: Client.last.id, payment_id: id, currency: currency, total: total,
                      discounts: discounts, total_with_discounts: total_with_discounts)
      end

      def new_footer(date)
        Footer.create(client_id: Client.last.id, payment_date: date)
      end
    end
  end
end
