# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

City.delete_all()
Spotfix.delete_all()
Photo.delete_all()
Attendee.delete_all()
Need.delete_all()

now = DateTime.now()
large_description = "Dummy entry with a long description.This is one spot that has never been cleaned before. Ok let's go clean it up soon. Oh, we need to make it a bit more longer. This is good enough I think."
short_description = "Short description.Let's just clean it"

bangalore = City.create(name: 'Bangalore', latitude: 12.9716, longitude: 77.5946)
chennai = City.create(name: 'Chennai', latitude: 13.0597, longitude: 80.2252)
delhi = City.create(name: 'Delhi', latitude: 28.6353, longitude: 77.225)
mumbai = City.create(name: 'Mumbai', latitude: 19.076, longitude: 72.8777)

City.create([
  {name: 'Kolkata', latitude: 22.5726, longitude: 88.3639 },
  {name: 'Hyderabad', latitude: 17.385044, longitude: 78.486671 },
  {name: 'Ahmedabad', latitude: 23.022505, longitude: 72.571362 }
])

Spotfix.create([
  {name: 'Fixie #12512', fix_date: now + 1.days, latitude: 12.911455 , longitude: 77.645660 , description: short_description, location: '433, 17th Cross Road, Sector 4, HSR Layout, Bengaluru, Karnataka 560102, India', city_id: bangalore.id},
  {name: 'Fixie #12513', fix_date: now + 1.days, latitude: 12.916998 , longitude: 77.633709, description: large_description, location: '4th Avenue Street, Koramangala 1st Block, Teachers Colony, HSR Layout, Bengaluru, Karnataka 560034, India', city_id: bangalore.id},
  {name: 'Fixie #12514', fix_date: now + 2.days, latitude: 12.919027, longitude: 77.632636 , description: short_description, location: 'Venkatapura Main Road, Koramangala 1st Block, Venkatapura, HSR Layout, Bengaluru, Karnataka 560034, India', city_id: bangalore.id},
  {name: 'Fixie #12515', fix_date: now + 3.days, latitude: 12.916789, longitude: 77.600127, description: large_description, location: 'Bannerghatta Slip Road, New Gurappana Palya, Stage 1, BTM Layout 1, Bengaluru, Karnataka 560029, India', city_id: bangalore.id},
  {name: 'Fixie #12516', fix_date: now + 3.days, latitude: 12.955269, longitude: 77.580558, description: short_description, location: '33, Doddamavalli, Sudhama Nagar, Bengaluru, Karnataka 560002, India', city_id: bangalore.id},
  {name: 'Fixie #12517', fix_date: now + 3.days, latitude: 12.960287, longitude: 77.642013, description: large_description, location: 'Old Airport Road, ISRO Colony, Domlur, Bengaluru, Karnataka 560071, India', city_id: bangalore.id},
  
  {name: 'Fixie #12518', fix_date: now + 4.days, latitude: 28.635308, longitude: 77.22496, description: short_description, location: 'Deen Dayal Upadhaya Marg, Minto Bridge Colony, Barakhamba, New Delhi, Delhi 110001, India', city_id: delhi.id},
  {name: 'Fixie #12519', fix_date: now + 4.days, latitude: 28.6115, longitude: 77.137499, description: large_description, location: 'Ring Road, Brar Square, Delhi Cantonment, New Delhi, Delhi 110010, India', city_id: delhi.id},
  {name: 'Fixie #12520', fix_date: now + 4.days, latitude: 28.581205, longitude: 77.121363, description: short_description, location: '
Cavalry Road, Shumran Lines, Delhi Cantonment, New Delhi, Delhi 110010, India', city_id: delhi.id},
  
  {name: 'Fixie #12521', fix_date: now + 4.days, latitude: 13.059705, longitude: 80.225228, description: short_description, location: '10, Jothi Ramalingam Street, Choolaimedu, Chennai, Tamil Nadu 600094, India', city_id: chennai.id},
  {name: 'Fixie #12522', fix_date: now + 4.days, latitude: 13.05356, longitude: 80.214186, description: large_description, location: '122/55, Vadapalani, Chennai, Tamil Nadu 600026, India', city_id: chennai.id},
  {name: 'Fixie #12523', fix_date: now + 4.days, latitude: 13.087337, longitude: 80.210752, description: large_description, location: '16/32, Y BLOCK 5th Street, Block Y, Anna Nagar, Anna Nagar, Chennai, Tamil Nadu 600040, India', city_id: chennai.id},

  {name: 'Fixie #12524', fix_date: now + 4.days, latitude: 19.075984, longitude: 72.877656, description: large_description, location: 'Wing-B, CST Road, Kapadia Nagar, Kurla West, Mumbai, Maharashtra 400070, India', city_id: mumbai.id},
  {name: 'Fixie #12525', fix_date: now + 4.days, latitude: 19.071852, longitude: 72.836523, description: large_description, location: '
10th Road, Khar West, Mumbai, Maharashtra 400052, India', city_id: mumbai.id},
  {name: 'Fixie #12526', fix_date: now + 4.days, latitude: 19.058711, longitude: 72.836866, description: short_description, location: '8, Swami Vivekanand Road, Bandra West, Mumbai, Maharashtra 400050, India', city_id: mumbai.id}
])

img1 = File.open('app/assets/images/dirty1.jpg')
img2 = File.open('app/assets/images/dirty2.jpg')
if User.count == 0
  User.create([
    { name: "Karthik Kastury", email: nil, gender: "male", uid: "10152441068273174"},
    { name: "Raison D'souza", email: nil, gender: "male", uid: "10154675874340541" },
    { name: "Dayanand Prabhu", email: nil, gender: "male", uid: "10152822098211383" },
    { name: "Shanmugapriya Gunasekaran", email: nil, gender: "female", uid: "1497147443874081" }
  ])
end
user_ids = User.limit(3).pluck(:id)

needs = [
  { name: 'People', count: 5, description: 'living things that dirty surroundings and later clean up' },
  { name: 'Brooms', count: 8, description: 'things that humans use to clean' },
  { name: 'Garbage Bags', count: 15, description: 'the dirt goes in here' }
]


Spotfix.all.each do |sf|
  sf.photos.create!([
    { image: img1, spotfix_id: sf.id },
    { image: img2, spotfix_id: sf.id }
  ])
  attendees = user_ids.sample(2)
  sf.attendees.create!([
    { user_id: attendees[0] },
    { user_id: attendees[1] }
  ])
  needs = needs.sample(2)
  sf.needs.create!([needs[0], needs[1]])
end