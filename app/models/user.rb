class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :name, :email, :password, :password_confirmation, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  
         mount_uploader :image, ImageUploader
end
