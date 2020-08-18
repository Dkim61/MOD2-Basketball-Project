class User < ApplicationRecord
    validates :user_name, presence: true, uniqueness: true
    validates :full_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :age, length: { minimum:0, maximum: 125 }

    has_many :favorites
    has_many :players, through: :favorites
end
