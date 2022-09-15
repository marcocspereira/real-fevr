module Api::V1
  class PlayersController < ApplicationController

    skip_before_action :authenticate_request, only: %i[index show]
    before_action :authorize_player

    # GET /api/v1/players
    def index
      players = Player.all

      render status: :ok,
             json: PlayerSerializer.new(players).serialize
    end

    def show
      player = Player.find(params[:id])

      render status: :ok,
             json: PlayerSerializer.new(player).serialize
    end

    def create

    end

    def updated
    end

    def destroy

    end

    private

    def authorize_player
      authorize Player
    end
  end
end