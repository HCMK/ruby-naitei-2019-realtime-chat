class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :validatable
  has_many :messages, dependent: :destroy
  has_many :admins, dependent: :destroy
  has_many :invites, dependent: :destroy
  has_many :join_rooms, dependent: :destroy
  validates :name, presence: true
  scope :search_name, ->(username){where("name like ?", "%#{username}%")}
end
