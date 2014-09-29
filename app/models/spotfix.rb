class Spotfix < ActiveRecord::Base

  belongs_to :leader, class_name: 'User', foreign_key: 'user_id'
  has_many :needs
  has_many :attendees
  has_many :users, through: :attendees
  has_many :photos
  has_many :invites
  has_many :invited_users, class_name: 'Invite', through: :invites, foreign_key: 'invitee_user_id'

  scope :active, -> { where(active: true) }
  scope :upcoming, -> { where("fix_date >= ?", DateTime.now() + 4.hours ) }
  scope :completed, -> { where("fix_date <= ?", DateTime.now() + 4.hours ) }


  def deactivate
    self.update({ active: false })
  end

  def activate
    self.update({ active: true })
  end
end
