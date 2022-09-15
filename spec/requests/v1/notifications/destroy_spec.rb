# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'DELETE /api/v1/notifications/:id', type: :request do
  let(:endpoint) { "/api/v1/notifications/#{notification.id}" }
  let(:notification) { create(:notification) }

  before { notification }

  describe 'with valid headers' do
    # authorize request
    let(:headers) { valid_headers }

    describe 'with admin permission' do
      let(:user) { create(:admin) }

      context 'with valid params' do
        it 'responds with a status 200 OK' do
          delete endpoint, params: {}, headers: headers
    
          expect(response).to have_http_status(:ok)
        end
    
        it 'removes one notification from database' do
          expect do
            delete endpoint, params: {}, headers: headers
          end.to change(Notification, :count).by(-1)
        end
      end
    end
    
    describe 'with basic permission' do
      let(:user) { create(:user) }

      it 'responds with a status of 403 forbidden' do
        delete endpoint, params: {}, headers: headers

        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe 'with invalid headers' do
    let(:headers) { invalid_headers }

    it 'responds with a status of 401 Unauthorized' do
      delete endpoint, params: {}, headers: headers

      expect(response).to have_http_status(:unauthorized)
    end
  end


end