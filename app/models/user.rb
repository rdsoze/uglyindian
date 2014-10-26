class User < ActiveRecord::Base

  has_many :attendees
  has_many :spotfixes, through: :attendees
  has_many :photos
  has_many :invites, foreign_key: 'invitee_user_id'
  has_many :inviteds, class_name: 'Invite', foreign_key: 'user_id'
  belongs_to :city

  class << self
    def create_user(auth)  
      User.create({
        uid: auth['uid'],
        email: auth['email'],
        name: auth['info']['name'],
        image: auth['info']['image'],
        token: auth['credentials']['token'],
        gender: auth['extra']['raw_info']['gender']
      })
    end
  end
end
