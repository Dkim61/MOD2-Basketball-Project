class PlayersController < ApplicationController    
    def index
        @players = Player.search(params[:query])

    end

    def show
        @player = Player.find(params[:id])
    end

    private

    def  player_params
        params.require(:player).permit(:firstName, :lastName, :query)
    end

end
