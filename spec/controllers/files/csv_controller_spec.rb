require 'rails_helper'

RSpec.describe Files::CsvController, type: :controller do
  authorized_user!

  context 'with authorization' do
    login_user

    describe 'POST import' do
      context 'valid parameters' do
        let(:file) { 
          Rack::Test::UploadedFile.new(
            Rails.root.join('spec', 'support', 'Dish.csv'), 'text/csv'
          )
        }
        let(:params) { { file: file, csv_type: ['Dish'] } }
        let(:file_services_import) { FileServices::Import.new(params).process }

        it 'process importing of file' do
          post :import, params: params

          expect(file_services_import[:status]).to eq(:ok)
          expect(file_services_import[:message]).to eq('File has been imported successfully.')
        end
      end

      context 'max file size' do
        let(:file) { 
          Rack::Test::UploadedFile.new(
            Rails.root.join('spec', 'support', 'MaxSizeExceed.csv'), 'text/csv'
          )
        }
        let(:params) { { file: file, csv_type: ['Dish'] } }
        let(:file_services_import) { FileServices::Import.new(params).process }

        it 'returns max file size error' do
          post :import, params: params

          expect(file_services_import[:status]).to eq(:unprocessable_entity)
          expect(file_services_import[:message]).to eq('Maximum file size is only 30mb.')
        end
      end

      context 'invalid file type' do
        let(:file) { 
          Rack::Test::UploadedFile.new(
            Rails.root.join('spec', 'support', 'Dish.txt'), 'text/plain'
          )
        }
        let(:params) { { file: file, csv_type: ['Dish'] } }
        let(:file_services_import) { FileServices::Import.new(params).process }

        it 'returns invalid file type error' do
          post :import, params: params

          expect(file_services_import[:status]).to eq(:unprocessable_entity)
          expect(file_services_import[:message]).to eq('Invalid File type.')
        end
      end

      context 'process error' do
        let(:file) do 
          Rack::Test::UploadedFile.new(
            Rails.root.join('spec', 'support', 'Dish.csv'), 'text/csv'
          )
        end
        let(:params) { { file: file, csv_type: ['Test'] } }
        let(:file_services_import) { FileServices::Import.new(params).process }

        it 'returns default error' do
          post :import, params: params

          expect(file_services_import[:status]).to eq(:unprocessable_entity)
          expect(file_services_import[:message]).to eq('An error occured while importing the file, please try again.')
        end
      end
    end

    describe 'GET export' do
      let(:menus) { create_list(:menu, 5) }

      context 'valid parameters' do
        let(:place) { menus.first.place }
        let(:date) { menus.first.date }
        let(:params) { { place: place, from: date, to: date} }
        let(:file_services_export) { FileServices::Export.new(params).process }
        let(:json_data) { file_services_export[:data].to_json }

        it 'process exporting file' do
          get :export, params: params
          
          expect(file_services_export[:status]).to eq(:ok)
          expect(file_services_export[:message]).to eq('File has been exported successfully.')
          expect(file_services_export[:data].count).to eq(5)
        end

        it 'returns listing in json format' do
          get :export, params: params, format: :json

          expect(response).to be_success
          expect(response.body).to eq(json_data)
        end
      end

      context 'invalid date' do
        let(:place) { menus.first.place }
        let(:date) { Time.zone.now }
        let(:params) { { place: place, from: Time.zone.now + 1.day, to: date} }

        it 'returns invalid date error' do
          get :export, params: params

          json_data = JSON.parse(response.body)
          expect(response).to have_http_status(:unprocessable_entity)
          expect(json_data['status'].to_sym).to eq(:unprocessable_entity)
          expect(json_data['errors']).to eq('Date is invalid!')
        end
      end
    end
  end
end