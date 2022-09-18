require 'rails_helper'

RSpec.describe 'GET /api/v1/players', type: :request do
  let(:endpoint) { '/api/v1/players' }

  before { create_list(:player, 5) }

  describe 'with authenticated users' do
    let(:headers) { valid_headers }
    
    describe 'as admin' do
      let(:user) { create(:admin) }

      it 'returns :ok' do
        get endpoint, params: {}, headers: headers
        expect(response).to have_http_status(:ok)
      end

      it 'returns a list of players' do
        get endpoint, params: {}, headers: headers
        expect(json.count).to eq(5)
      end
    end

    describe 'as basic' do
      let(:user) { create(:user) }

      it 'returns :ok' do        
        get endpoint, params: {}, headers: headers
        expect(response).to have_http_status(:ok)
      end

      it 'returns a list of players' do
        get endpoint, params: {}, headers: headers
        expect(json.count).to eq(5)
      end
    end
  end

  describe 'with unauthenticated user' do
    let(:headers) { invalid_headers }

    it 'returns :ok' do
      get endpoint, params: {}, headers: headers
      expect(response).to have_http_status(:ok)
    end

    it 'returns a list of players' do
      get endpoint, params: {}, headers: headers
      expect(json.count).to eq(5)
    end
  end
end
