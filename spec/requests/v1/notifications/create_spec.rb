# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'POST /api/v1/notifications', type: :request do
  let(:endpoint) { '/api/v1/notifications' }
  let(:player) { create(:player) }

  before { player }

  let(:notification_params) do
    {
        player_id: player.id,
        message: Faker::Crypto.sha256,
    }.to_json
  end

  describe 'with valid headers' do
    # authorize request
    let(:headers) { valid_headers }

    describe 'with admin permission' do
      let(:user) { create(:admin) }

      it 'responds with a status 201 Created' do
        post endpoint, params: notification_params, headers: headers

        expect(response).to have_http_status(:created)
      end

      it 'adds one more unity to notifications' do
        expect do
          post endpoint, params: notification_params, headers: headers
        end.to change(Notification, :count).by(1)
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