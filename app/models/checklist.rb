class Checklist < ApplicationRecord
    belongs_to :task
   
    scope :recent, -> { order(created_at: :desc) }
    
    def task
        return Task.find_by(id: self.task_id)
    end
    
    private
    
    def validate_name_not_including_comma
        errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
    end
end
