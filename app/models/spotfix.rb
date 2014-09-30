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
  before_create :reverse_geocode

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
      '<h1 id="firstHeading" class="firstHeading">Uluru</h1>'+
      '<div id="bodyContent">'+
      '<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large ' +
      'sandstone rock formation in the southern part of the '+
      'Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) '+
      'south west of the nearest large town, Alice Springs; 450&#160;km '+
      '(280&#160;mi) by road. Kata Tjuta and Uluru are the two major '+
      'features of the Uluru - Kata Tjuta National Park. Uluru is '+
      'sacred to the Pitjantjatjara and Yankunytjatjara, the '+
      'Aboriginal people of the area. It has many springs, waterholes, '+
      'rock caves and ancient paintings. Uluru is listed as a World '+
      'Heritage Site.</p>'+
      '<p>Attribution: Uluru, <a href="http://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">'+
      'http://en.wikipedia.org/w/index.php?title=Uluru</a> '+
      '(last visited June 22, 2009).</p>'+
      '</div>'+
      '</div>'
  end

  def short_desc
    "#{description[0..50]}..."
  end

end
