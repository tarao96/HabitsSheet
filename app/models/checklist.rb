class Checklist < ApplicationRecord
    belongs_to :task
    has_many :likes
   
    scope :recent, -> { order(created_at: :desc) }
    
    def task
        return Task.find_by(id: self.task_id)
    end
    
    private
    
    def validate_name_not_including_comma
        errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
    end
    
    def liked_by?(user)
        likes.where(user_id: user.id).exists?
    end
    
    def self.search(search)
        if search
            Checklist.where(['try LIKE ?',"%#{search}%"])
        else
            Checklist.all
        end
    end
end
