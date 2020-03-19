class User < ApplicationRecord
  has_many :created_arrows, class_name: 'Arrow', foreign_key: :creator_id, dependent: :destroy
  has_many :received_arrows, class_name: 'Arrow', foreign_key: :destination_id, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save :downcase_email
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, on: :create

  private

  def downcase_email
    email.downcase!
  end
end
