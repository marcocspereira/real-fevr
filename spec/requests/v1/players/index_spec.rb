require 'rails_helper'
#require_relative '../../../support/devise'

RSpec.describe 'GET /api/v1/players', type: :request do
  let(:endpoint) { '/api/v1/players' }

  describe 'with authenticated users' do
    before { create_list(:player, 5) }

    describe 'as admin' do
      include_context :login_admin

      it 'returns :ok' do
        
        get endpoint
        expect(response).to have_http_status(:ok)
      end
    end

    describe 'as basic' do
      include_context :login_user

      it 'returns :ok' do
        
        get endpoint
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'with unauthenticated user' do
    it 'returns :unauthorized' do
      get endpoint
      expect(response).to have_http_status(:unauthorized)
    end 
  end
end
