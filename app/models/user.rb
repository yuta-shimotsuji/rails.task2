class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :rooms
  has_many :reservations
  has_many :reservation_rooms, through: :reservations, source: :room

  validates :name, :email, :password, :password_confirmation, presence: true, on: :create

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  
         mount_uploader :image, ImageUploader
end
