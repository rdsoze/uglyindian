class Invite < ActiveRecord::Base

  belongs_to :user
  belongs_to :invitee, class_name: 'User', foreign_key: 'invitee_user_id'
  belongs_to :spotfix
end
