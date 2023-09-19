class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many_attached :images

  validates :title, presence: true
  validates :description, presence: true
  validate :image_content_type
  validate :image_file_size

  def image_content_type
    images.each do |image|
      puts image.content_type
      if !image.content_type.in?(%('image/jpeg image/png'))
        errors.add(:images, "La imagen debe ser JPEG o PNG")
        puts "La imagen debe ser JPEG o PNG y es #{image.content_type}"
      end
    end
  end

  def image_file_size
    images.each do |image|
      if image.byte_size > 5.megabytes
        errors.add(:images, "La imagen debe ser menor que 5MB")
      end
    end
  end
end
