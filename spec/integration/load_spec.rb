# frozen_string_literal: true

require 'swagger_helper'

describe 'Increase API' do
  path '/api/v1/load' do
    get('Get All Data from INCREASE API') do
      response(204, 'succesful') do
        tags 'Data'
        consumes 'application/json'
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
