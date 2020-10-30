class User < ApplicationRecord
has_secure_password

has_many :posts, dependent: :destroy
has_many :favorites, dependent: :destroy
has_many :favorite_posts, through: :favorites, source: :post

mount_uploader :icon, IconUploader

  validates :icon, presence: true
  validates :name, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, with: /@/



end
