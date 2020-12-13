class Post < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :image, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :text, presence: true, length: { maximum: 200 }
end
