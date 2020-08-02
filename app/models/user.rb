class User < ApplicationRecord
    before_save { self.email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                      uniqueness: { case_sensitive: false }
    has_secure_password
    
    has_many :logs
    has_many :favorites, dependent: :destroy
    has_many :favorite_logs, through: :favorites, source: :log
    
    def favorite(log)
     self.favorites.find_or_create_by(log_id: log.id)
    end
  
    def unfavorite(log)
     favorite = self.favorites.find_by(log_id: log.id)
     favorite.destroy if favorite
    end
  
    def favorite?(log)
     self.favorite_logs.include?(log)
    end
    
end
