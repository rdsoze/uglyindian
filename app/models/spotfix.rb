class Spotfix < ActiveRecord::Base

  belongs_to :leader, class_name: 'User', foreign_key: 'user_id'
  belongs_to :city
  has_many :needs
  has_many :attendees
  has_many :users, through: :attendees
  has_many :photos
  has_many :invites
  has_many :invited_users, class_name: 'Invite', through: :invites, foreign_key: 'invitee_user_id'

  scope :active, -> { where(active: true) }
  scope :upcoming, -> { where("fix_date >= ?", DateTime.now() + 4.hours ) }
  scope :completed, -> { where("fix_date <= ?", DateTime.now() + 4.hours ) }

  reverse_geocoded_by :latitude, :longitude, :address => :location
  before_create :reverse_geocode, if: ->(obj){ obj.location.nil? }
  before_create :set_name, if: ->(obj){ obj.name.nil? }

  def deactivate
    self.update({ active: false })
  end

  def activate
    self.update({ active: true })
  end

  def info
    '<div id="content">'+
      '<div id="siteNotice">'+
      '</div>'+
      "<h1 id='firstHeading' class='firstHeading'>#{name}</h1>"+
      '<div id="bodyContent">'+
      "<p>#{description}</p>" +
      "<button type='button' class='view btn btn-primary'>" + 
      "<a href=/spotfixes/#{id}>View</a>"+
      "</button>" +
      '</div>'+
      '</div>'
  end

  def short_desc
    "#{description[0..50]}..."
  end

  def short_loc
    loc = location.split(",")
    "#{loc[0..(loc.length - 3)].join(",")}"
  end

  def set_name
    self.name = "Fixie ##{13500 + Spotfix.last.id}"
  end

end
