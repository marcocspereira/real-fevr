# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'PUT /api/v1/players/:id', type: :request do
  let(:endpoint) { "/api/v1/players/#{player.id}" }

  describe 'with valid headers' do
    # authorize request
    let(:headers) { valid_headers }
    let(:player) { create(:player) }

    #before do
    #  catalog
    #end

    describe 'with admin permission' do
      let(:user) { create(:admin) }

      describe 'with valid params' do
        let(:player_params) do
          {
            number: 99,
          }.to_json
        end

        it 'respons with a status 200 OK' do
          put endpoint, params: player_params, headers: headers

          expect(response).to have_http_status(:ok)
        end

        it 'responds with the updated player' do
          put endpoint, params: player_params, headers: headers

          expect(json['number']).to eq(JSON.parse(player_params)['number'])
        end
      end
    end

    describe 'with basic permission' do
      let(:user) { create(:user) }

      it 'responds with a status 403 forbidden' do
        put endpoint, params: {}, headers: headers

        expect(response).to have_http_status(:forbidden)
      end

      it 'responds with <<Not enough privileges>> error message' do
        put endpoint, params: {}, headers: headers

        expect(json['error']).to match(/Not enough privileges/)
      end
    end

    describe 'with invalid headers' do
      let(:headers) { invalid_headers }

      it 'responds with a status of 401 Unauthorized' do
        put endpoint, params: {}, headers: headers

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end