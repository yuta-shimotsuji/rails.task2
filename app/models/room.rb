class Room < ApplicationRecord

    belongs_to :user
    has_many :reservations
    has_many :reservation_users, through: :reservations, source: :user

    mount_uploader :room_image, ImageUploader

    validates :room_image, :room_info, :room_price, :room_address , presence: true
    validates :room_price, numericality: { greater_than_or_equal_to: 1 }

end
