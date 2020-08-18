class PlayersController < ApplicationController
    before_action :find_player, only: [:show]
    def index
        @players = Player.all
    end

    def show
    end

    def new
        @player = Player.new
    end

    def create
        @player = Player.create(player_params)
        redirect_to player_path(@player)
    end
        
    private

    def player_params
        params.require(:player).permit(:name)
    end

    def find_player
        @player = Player.find(params[:id])
    end
end
