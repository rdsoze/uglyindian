object @city
attributes :id, :name
node(:count) do
  {:spotfixes => @spotfix_count,
   :attendees => @attendee_count }
end