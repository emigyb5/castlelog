class Log < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :comment, presence: true, length: { maximum: 800 }
  validates :tag, length: { maximum: 20 }
 
  mount_uploader :image, ImageUploader

end
