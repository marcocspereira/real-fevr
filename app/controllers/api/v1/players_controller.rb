module Api::V1
  class PlayersController < ApplicationController

    skip_before_action :authenticate_user!, only: %i[index]
    before_action :authorize_player

    def index
      players = Player.all

      render status: :ok,
             json: PlayerSerializer.new(players).serialize
    end

    private

    def authorize_player
      authorize Player
    end
  end
end