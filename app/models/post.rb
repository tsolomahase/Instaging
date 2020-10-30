class Post < ApplicationRecord
belongs_to :user
has_many :photos, dependent: :destroy

has_many :favorites, dependent: :destroy
has_many :favorite_users, through: :favorites, source: :user

mount_uploader :image, ImageUploader

validates :image, presence: true
validates :content, presence: true, length: { maximum: 140 }

def is_belongs_to? user
  Post.find_by(user_id: user.id, id: id)
end

end
