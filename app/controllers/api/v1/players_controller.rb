module Api::V1
  class PlayersController < ApplicationController

    skip_before_action :authenticate_request, only: %i[index show subscribe]
    before_action :authorize_player

    # POST api/v1/players/:id/subscribe
    # TODO: change route from GET to POST
    def subscribe
      player = Player.find(params[:player_id])
      subscription = PlayerSubscription.new(player: player, user: current_user)
      subscription.save!
      #Notification.create!(player: Player.first, message: "oi")

      render status: :created,
             json: {}
    end

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

    # POST /api/v1/players
    def create
      player = Player.new(player_params)
      player.save!

      render status: :created,
             json: PlayerSerializer.new(player).serialize
    end

    # PUT /api/v1/players/:id
    def update
      player = Player.find(params[:id])
      player.update!(player_params)

      render status: :ok,
             json: PlayerSerializer.new(player).serialize
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

    def player_params
      params.require(:player).permit(:id, :birthdate, :name, :nationality, :number, :position)
    end
  end
end