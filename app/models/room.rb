class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :admins, dependent: :destroy
  has_many :invites, dependent: :destroy
  has_many :join_rooms, dependent: :destroy
  has_many :administrators, through: :admins, source: :user
  has_many :users, through: :join_rooms
  scope :recent, ->{order new_message: :desc}
  validates :name, presence: true
  validates :description, presence: true,
    length: {maximum: Settings.room.discription.max_length}
end
