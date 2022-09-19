module Api::V1 # :nodoc:
  # controller that handles login an sign-up actions
  class AuthenticationController < ApplicationController

    skip_before_action :authenticate_request

    # POST /api/v1/auth/login
    def login
      @user = User.find_by_email(login_params[:email])
      if @user&.authenticate(login_params[:password])
        token = JsonWebToken.encode(user_id: @user.id)
        time = Time.now + 24.hours.to_i
        render  status: :ok,
                json: { token: token,
                        user: { email: @user.email, is_admin: @user.admin },
                        exp: time.strftime("%m-%d-%Y %H:%M") }
      else
        render  status: :unauthorized,
                json: { error: 'unauthorized' } 
      end
    end

    private

    def login_params
      params.permit(:email, :password)
    end
  end
end