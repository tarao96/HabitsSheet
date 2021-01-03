class Task < ApplicationRecord
    belongs_to :user
    has_many :checklists, dependent: :destroy
    validates :name, presence: true
    validates :name, length: { maximum: 30 }
    validate :validate_name_not_including_comma
    
    scope :recent, -> { order(created_at: :desc) }
    
    private
    
    def validate_name_not_including_comma
        errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
    end
    
    def liked_by?(user)
        likes.where(user_id: user.id).exists?
    end
    
end
