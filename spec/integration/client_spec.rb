# spec/integration/blogs_spec.rb
require 'swagger_helper'

describe 'Increase API' do

  path '/api/v1/clients' do
    get('Get All Clients') do
      response(200, 'succesful') do
        tags 'Clients'
        consumes 'application/json'
        schema type: :object,
               properties: {
                       id: { type: :integer },
                       client_id: { type: :string }          
                   }               
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

  path '/api/v1/clients/{id}' do
    get('Get One Client Transactions') do
      response(200, 'succesful') do
        tags 'Clients'
        consumes 'application/json'
        parameter name: :id, in: :path, type: :string
        schema type: :object,
               properties: {
                       id: { type: :integer },
                       client_id: { type: :string }
                   }
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

  path '/api/v1/clients/{id}/payments' do
    get('Get One Client Payment date and Payment amount') do
      response(200, 'succesful') do
        tags 'Clients'
        consumes 'application/json'
        parameter name: :id, in: :path, type: :string
        schema type: :object,
               properties: {
                       id: { type: :integer },
                       client_id: { type: :string }
                   }
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