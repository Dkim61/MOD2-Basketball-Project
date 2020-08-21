class PlayersController < ApplicationController
    before_action :find_player, only: [:show]
    
    def index
        @players = Player.search(params[:query])
    end

    def show
    end


    private
    def  player_params
        params.require(:player).permit(:firstName, :lastName, :query)
    end

    def find_player
        @player = Player.find(params[:id])
    end
end
