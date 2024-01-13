class Room < ApplicationRecord
    belongs_to:user
    mount_uploader :image_room, ImageRoomUploader
end
