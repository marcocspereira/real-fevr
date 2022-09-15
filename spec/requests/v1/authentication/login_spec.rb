# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'POST /api/v1/auth/login', type: :request do
  # Authentication test suite
  describe 'POST /api/v1/auth/login' do
    let(:login_url) { '/api/v1/auth/login' }
    # create test user
    let(:user) { create(:user) }
    # set headers for authorization
    let(:headers) { valid_headers.except('Authorization') }
    # set test valid and invalid credentials
    let(:valid_credentials) do
      {
        email: user.email,
        password: user.password
      }.to_json
    end
    let(:invalid_credentials) do
      {
        email: Faker::Internet.email,
        password: Faker::Internet.password
      }.to_json
    end

    # returns auth token when request is valid
    context 'when request is valid' do
      it 'returns an authentication token' do
        post login_url, params: valid_credentials,
                        headers: headers

        expect(json['token']).not_to be_nil
      end

      it 'returns logged user token' do
        post login_url, params: valid_credentials,
                        headers: headers

        expect(json['token']).not_to be_nil
      end
    end

    # returns failure message when request is invalid
    context 'when request is invalid' do
      it 'returns a failure message' do
        post login_url, params: invalid_credentials,
                        headers: headers

        expect(json['error']).to match(/unauthorized/)
      end
    end
  end
end
