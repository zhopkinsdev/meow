class Photo < ApplicationRecord
  belongs_to :cat
  mount_uploader :picture, PictureUploader
end
