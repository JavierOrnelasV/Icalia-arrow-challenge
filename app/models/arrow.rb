class Arrow < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  belongs_to :destination, class_name: 'User', foreign_key: :destination_id
  validates :reason, presence: true
end
