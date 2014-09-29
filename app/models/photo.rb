class Photo < ActiveRecord::Base

  belongs_to :spotfix
  belongs_to :user

end
