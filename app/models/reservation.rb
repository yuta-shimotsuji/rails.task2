class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :room

    validates :number_of_people, :start_day, :last_day, presence: true
    validates :number_of_people, numericality: { greater_than_or_equal_to: 1 }


end 