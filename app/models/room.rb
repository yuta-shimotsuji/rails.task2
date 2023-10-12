class Room < ApplicationRecord

    mount_uploader :room_image, ImageUploader

    validates :room_image, :room_info, :room_price, :room_address , presence: true
    validates :room_price, numericality: { greater_than_or_equal_to: 1 }

end
