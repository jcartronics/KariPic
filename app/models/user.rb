class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :avatar

  validates :name, presence: true
  validates :avatar, presence: true
  validate :avatar_content_type
  validate :avatar_file_size

  def avatar_content_type
    puts avatar.content_type
    if !avatar.content_type.in?(%('image/jpeg image/png'))
      errors.add(:avatar, "La imagen debe ser JPEG o PNG")
      puts "La imagen debe ser JPEG o PNG y es #{avatar.content_type}"
    end
  end

  def avatar_file_size
    if avatar.byte_size > 5.megabytes
      errors.add(:avatar, "La imagen debe ser menor que 5MB")
    end
  end

  enum role: %w[user admin]
end
