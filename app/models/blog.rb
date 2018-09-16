class Blog < ApplicationRecord
    mount_uploader :image, ImageUploader
    validates :content, presence: true, length: { maximum: 140 }
    
    belongs_to :user, optional: true
    validates :user_id, presence: true
    
    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user
    
end
