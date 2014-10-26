object @spotfix
attributes :id, :name, :description, :fix_date, :latitude, :longitude, :city_id

child :needs do
  attributes :name, :count, :description
end

child :attendees do
	attributes :name, :user_id, :fb_id
end
