# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /api/v1/players/:id', type: :request do
  let(:endpoint) { "/api/v1/players/#{player.id}" }
  let(:player) { create(:player) }

  describe 'with valid headers' do
    # authorize request
    let(:headers) { valid_headers }

    describe 'with admin permission' do
      let(:user) { create(:admin) }

      it 'responds with a status 200 OK' do
        get endpoint, params: {}, headers: headers

        expect(response).to have_http_status(:ok)
      end

      it 'responds with the selected player' do
        get endpoint, params: {}, headers: headers

        expect(json['id']).to eq(player.id)
      end
    end

    describe 'with basic permission' do
      let(:user) { create(:user) }

      it 'responds with a status 200 OK' do
        get endpoint, params: {}, headers: headers

        expect(response).to have_http_status(:ok)
      end

      it 'responds with the selected player' do
        get endpoint, params: {}, headers: headers

        expect(json['id']).to eq(player.id)
      end
    end
  end

  describe 'with invalid headers' do
    let(:headers) { invalid_headers }

    it 'responds with a status 200 OK' do
      get endpoint, params: {}, headers: headers

      expect(response).to have_http_status(:ok)
    end

    it 'responds with the selected player' do
      get endpoint, params: {}, headers: headers

      expect(json['id']).to eq(player.id)
    end
  end
end