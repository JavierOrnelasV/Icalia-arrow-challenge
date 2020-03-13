class User < ApplicationRecord
<<<<<<< HEAD
  has_many :created_arrows, class_name: 'Arrow', foreign_key: :creator_id
  has_many :received_arrows, class_name: 'Arrow', foreign_key: :destination_id
=======
  has_many :arrows, foreign_key: :creator_id
>>>>>>> 44524c6c7d2f878cb9667d1547a5fca000b40e68
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
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
