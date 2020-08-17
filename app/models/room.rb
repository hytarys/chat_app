class Room < ApplicationRecord
  has_many :room_users
  has_many :messages, dependent: :destroy
  has_many :users, through: :room_users, dependent: :destroy#roomに紐づいた情報も削除される
  validates :name, presence: true
end
