class Player < ApplicationRecord
    has_many :favorites
    has_many :users, through: :favorites
    
    def self.search(query)
        if query.present?
            where("LASTNAME like ?", "%#{query}%")
        else
            Player.all
        end
    end   


end
