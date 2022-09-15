require 'rails_helper'
#require_relative '../../../support/devise'

RSpec.describe 'GET /api/v1/players', type: :request do
  let(:endpoint) { '/api/v1/players' }

  before { create_list(:player, 5) }

  describe 'with authenticated users' do    
    describe 'as admin' do
      include_context :login_admin

      it 'returns :ok' do
        get endpoint
        expect(response).to have_http_status(:ok)
      end

      it 'returns a list of players' do
        get endpoint
        expect(response).to have_http_status(:ok)
        expect(json.count).to eq(5)
      end
    end

    describe 'as basic' do
      include_context :login_user

      it 'returns :ok' do        
        get endpoint
        expect(response).to have_http_status(:ok)
      end

      it 'returns a list of players' do
        get endpoint
        expect(response).to have_http_status(:ok)
        expect(json.count).to eq(5)
      end
    end
  end

  describe 'with unauthenticated user' do
    it 'returns :ok' do
      get endpoint
      expect(response).to have_http_status(:ok)
    end

    it 'returns a list of players' do
      get endpoint
      expect(response).to have_http_status(:ok)
      expect(json.count).to eq(5)
    end
  end
end


