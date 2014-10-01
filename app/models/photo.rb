class Photo < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  
  belongs_to :spotfix
  belongs_to :user

end
