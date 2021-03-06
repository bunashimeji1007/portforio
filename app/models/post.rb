class Post < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :image, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :text, presence: true, length: { maximum: 200 }

end
