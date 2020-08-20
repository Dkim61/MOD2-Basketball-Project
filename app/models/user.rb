class User < ApplicationRecord
    validates :user_name, presence: true, uniqueness: true
    validates :full_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :age, numericality: { greater_than: 0 }

    has_many :favorites
    has_many :players, through: :favorites
end
