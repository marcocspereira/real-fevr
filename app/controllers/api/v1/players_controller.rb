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

    # GET /api/v1/players/:id
    def show
      player = Player.find(params[:id])

      render status: :ok,
             json: PlayerSerializer.new(player).serialize
    end

    def create

    end

    def updated
    end

    # DELETE /api/v1/players/:id
    def destroy
      Player.destroy(params[:id])

      render status: :ok,
             json: {}
    end

    private

    def authorize_player
      authorize Player
    end
  end
end