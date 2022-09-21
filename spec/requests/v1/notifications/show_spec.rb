# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /api/v1/notifications/:id', type: :request do
  let(:endpoint) { "/api/v1/notifications/#{notification.id}" }
  let(:notification) { create(:notification) }

  describe 'with valid headers' do
    # authorize request
    let(:headers) { valid_headers }

    describe 'with admin permission' do
      let(:user) { create(:admin) }

      it 'responds with a status 200 OK' do
        get endpoint, params: {}, headers: headers

        expect(response).to have_http_status(:ok)
      end

      it 'responds with the selected notification' do
        get endpoint, params: {}, headers: headers

        expect(json['id']).to eq(notification.id)
      end
    end

    describe 'with basic permission' do
      let(:user) { create(:user) }

      it 'responds with a status 403 forbidden' do
        get endpoint, params: {}, headers: headers

        expect(response).to have_http_status(:forbidden)
      end

      it 'responds with <<Not enough privileges>> error message' do
        get endpoint, params: {}, headers: headers

        expect(json['error']).to match(/Not enough privileges/)
      end
    end
  end

  describe 'with invalid headers' do
    let(:headers) { invalid_headers }

    it 'responds with a status of 401 Unauthorized' do
      get endpoint, params: {}, headers: headers

      expect(response).to have_http_status(:unauthorized)
    end
  end
end