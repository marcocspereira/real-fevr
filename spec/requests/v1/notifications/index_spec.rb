require 'rails_helper'


# IMPLEMENTAR TESTE AO INDEX E DESTROY COM LOGIN  

RSpec.describe 'GET /api/v1/notifications', type: :request do
  let(:endpoint) { '/api/v1/notifications' }

  before { create_list(:notification, 5) }

  describe 'with authenticated users' do
    let(:headers) { valid_headers }
    
    describe 'as admin' do
      let(:user) { create(:admin) }

      it 'returns :ok' do
        get endpoint, params: {}, headers: headers
        expect(response).to have_http_status(:ok)
      end

      it 'returns a list of notifications' do
        get endpoint, params: {}, headers: headers
        expect(json.count).to eq(5)
      end
    end

    describe 'as basic' do
      let(:user) { create(:user) }

      it 'responds with a status of 403 forbidden' do
        get endpoint, params: {}, headers: headers

        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe 'with unauthenticated user' do
    let(:headers) { invalid_headers }

    it 'responds with a status of 401 Unauthorized' do
      get endpoint, params: {}, headers: headers

      expect(response).to have_http_status(:unauthorized)
    end
  end
end


