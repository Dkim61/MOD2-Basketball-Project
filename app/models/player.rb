class Player < ApplicationRecord
    has_many :favorites
    has_many :users, through: :favorites

    def get_stats(player_id)
        @player.statistics
    end
    
end
