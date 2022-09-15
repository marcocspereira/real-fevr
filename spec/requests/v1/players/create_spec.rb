# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'POST /api/v1/players', type: :request do
  let(:endpoint) { '/api/v1/players' }

  let(:player_params) do
    {
        birthdate: Faker::Date.birthday(min_age: 15, max_age: 95),
        name: Faker::Name.unique.name,
        nacionality: Faker::Name.unique.name,
        number: rand(1..100),
        position: Player::POSITIONS.sample
    }.to_json
  end

  describe 'with valid headers' do
    # authorize request
    let(:headers) { valid_headers }

    describe 'with admin permission' do
      let(:user) { create(:admin) }

      it 'responds with a status 201 Created' do
        post endpoint, params: player_params, headers: headers

        expect(response).to have_http_status(:created)
      end

      it 'adds one more unity to players' do
        expect do
          post endpoint, params: player_params, headers: headers
        end.to change(Player, :count).by(1)
      end
    end

    describe 'with basic permission' do
      let(:user) { create(:user) }

      it 'responds with a status of 403 forbidden' do
        post endpoint, params: {}, headers: headers

        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe 'with invalid headers' do
    let(:headers) { invalid_headers }

    it 'responds with a status of 401 Unauthorized' do
      post endpoint, params: {}, headers: headers

      expect(response).to have_http_status(:unauthorized)
    end
  end
end