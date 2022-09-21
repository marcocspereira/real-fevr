module Api::V1
  class PlayersController < ApplicationController

    skip_before_action :authenticate_request, only: %i[index show]
    before_action :authorize_player

    # POST api/v1/players/:id/subscribe
    def subscribe
      player = Player.find(params[:player_id])
      subscription = PlayerSubscription.new(player: player, user: current_user)
      subscription.save!

      render status: :created,
             json: {}
    end

    # GET /api/v1/players?page=:page&per_page=:per_page&order_by=:position
    def index
      players = Player.all.order(order_by)
                      .limit(per_page).offset(paginate_offset)
      
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

    def order_by
      return 'id' unless params[:order_by]
      params[:order_by] if %(position nationality birthdate).include?(params[:order_by])
    end
  end
end