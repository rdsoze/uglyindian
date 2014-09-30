class City < ActiveRecord::Base
  geocoded_by :full_name
  before_create :geocode  

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
