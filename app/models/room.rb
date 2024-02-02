class Room < ApplicationRecord
    belongs_to:user
    has_many:reservations
    mount_uploader :image_room, ImageRoomUploader
    
    validates :price, numericality: { greater_than_or_equal_to: 1 }
    validate :start_future

    def start_future
      if start_date.present? && start_date < Date.today
        errors.add(:start_date, "は今日以降の日付を選択してください")
      end
    end
  
end




