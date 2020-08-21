class FavoritesController < ApplicationController
    def new
        @favorite = Favorite.new
    end

    def create
        @favorite = Favorite.create(favorite_params)
        redirect_to user_path(@favorite.user_id)
    end

    def destroy
        @favorite = Favorite.find(params[:id])
        @favorite.destroy
        # redirect_to users_path
    end

    private

    def favorite_params
        params.require(:favorite).permit(:user_id, :player_id)
    end
end
