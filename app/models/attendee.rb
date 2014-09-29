class Attendee < ActiveRecord::Base

  belongs_to :user
  belongs_to :spotfix

  scope :confirmed, -> { where(confirmed: true) }
  scope :unconfirmed, -> { where(confirmed: true) }
  scope :attended, -> { where(attended: true) }
  scope :dropped, -> { where(attended: false) }

end
