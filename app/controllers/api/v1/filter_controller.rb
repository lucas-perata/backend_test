# frozen_string_literal: true

module Api
  module V1
    class FilterController < ApplicationController
      @@count = 0

      def load
        response = HTTParty.get('https://increase-transactions.herokuapp.com/file.txt',
                                headers: { 'Authorization' => ENV['API_KEY'] })
        if response.code == 200
          filter_request(response)
        elsif response.code == 500 && @@count < 2
          sleep 2
          puts 'Trying again'
          @@count += 1
          load
        elsif response.code == 500 && @@count == 3
          puts "Cannot reach API"
          sleep 1 
        end
      end

      def filter_request(response)
        response_body = response.body
        r = response_body.lines
        n = r.count
        b = 0

        while n > b && @@count < 6
          filter_line = r[n - 1]

          if r[n - 1][0].to_i === 4
            get_client(filter_line[24..55])
            new_footer(filter_line[16..23])
          elsif r[n - 1][0].to_i === 2
            new_transaction(filter_line[1..32], filter_line[33..46], filter_line[51])
          elsif r[n - 1][0].to_i === 1
            new_header(filter_line[1..32], filter_line[36..38], filter_line[39..51], filter_line[52..64],
                       filter_line[65..77])
          end
          n -= 1
        end
      end

      def new_client(response)
        id = response['id']
        email = response['email']
        first_name = response['first_name']
        last_name = response['last_name']
        job = response['job']
        address = response['address']
        zip_code = response['zip_code']
        phone = response['phone']

        Client.create(client_id: id, first_name: first_name, last_name: last_name, email: email, job: job,
                      address: address, zip_code: zip_code, phone: phone)
      end

      def new_transaction(id, amount, type)
        Transaction.create(transaction_id: id, amount: amount, status: type, client_id: Client.last.id)
      end

      def new_header(id, currency, total, discounts, total_with_discounts)
        Header.create(client_id: Client.last.id, payment_id: id, currency: currency, total: total,
                      discounts: discounts, total_with_discounts: total_with_discounts, footer_id: Footer.last.id)
      end

      def new_footer(date)
        Footer.create(client_id: Client.last.id, payment_date: date) unless Client.last.nil?
      end

      def get_client(id)
        client_id = id
        response = HTTParty.get("https://increase-transactions.herokuapp.com/clients/#{client_id}",
                                headers: { 'Authorization' => ENV['API_KEY'] })

        if response.code == 200
          puts id
          response_body = response.body
          parsed_response = JSON.parse(response_body)
          puts parsed_response
          new_client(parsed_response)
        elsif response.code == 500 && @@count < 6
          puts 'Error server: waiting to do the request again'
          @@count += 1
          sleep 1
          puts 'Trying again'
          get_client(client_id)
        elsif response.code == 500 && @@count == 6
          puts 'Stopping the requests'
          return
        end
      end
    end
  end
end
