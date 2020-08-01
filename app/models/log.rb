class Log < ApplicationRecord
  belongs_to :user
  has_many :favorites
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :comment, presence: true, length: { maximum: 800 }
  validates :image, presence: true
  validates :tag, length: { maximum: 20 }
 
  mount_uploader :image, ImageUploader

end
