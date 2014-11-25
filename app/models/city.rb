class City < ActiveRecord::Base
  has_many :spotfixes
  has_many :attendees, through: :spotfixes
  
  geocoded_by :full_name
  before_create :geocode, if: ->(obj){ obj.name.present? and obj.latitude.nil? }  

  def self.find_or_create(name)
    city = City.find_by_name(name)
    unless city
      city = City.create({name: name})
    end
    city
  end

  def full_name
    (name =~ /india/i)? name : "#{name} india"
  end

end
