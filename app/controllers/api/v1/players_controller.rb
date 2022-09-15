module Api::V1
  class PlayersController < ApplicationController

    before_action :authenticate_api_v1_user!

    def index
      render status: :ok,
            json: {}
    end
  end
end