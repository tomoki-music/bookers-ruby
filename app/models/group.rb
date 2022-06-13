class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users

  has_one_attached :image
  validates :name, presence: true, uniqueness: true
  validates :introduction, presence: true

  def get_group_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no-image-icon.jpg')
      image.attach(io: File.open(file_path), filename: 'no-image-icon.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

end
