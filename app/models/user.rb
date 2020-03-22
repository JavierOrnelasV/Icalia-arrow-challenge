class User < ApplicationRecord
  has_many :created_arrows, class_name: 'Arrow', foreign_key: :creator_id, dependent: :destroy
  has_many :received_arrows, class_name: 'Arrow', foreign_key: :destination_id, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 50 }
end
