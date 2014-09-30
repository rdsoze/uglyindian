# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

now = DateTime.now()
large_description = "This file should contain all the record creation needed to seed the database with its default values. The data can then be loaded with the rake db:seed (or created alongside the db with db:setup). Ok let's go"
short_description = "Let's just clean it"
city = City.create(name: 'Bangalore')

Spotfix.create([
  {name: 'Fixie #12512', fix_date: now + 1.days, latitude: 12.911455 , longitude: 77.645660 , description: short_description, location: '', city_id: city.id},
  {name: 'Fixie #12513', fix_date: now + 1.days, latitude: 12.916998 , longitude: 77.633709, description: large_description, location: '', city_id: city.id},
  {name: 'Fixie #12514', fix_date: now + 2.days, latitude: 12.919027, longitude: 77.632636 , description: short_description, location: '', city_id: city.id},
  {name: 'Fixie #12515', fix_date: now + 3.days, latitude: 12.916789, longitude: 77.600127, description: large_description, location: '', city_id: city.id},
  {name: 'Fixie #12516', fix_date: now + 3.days, latitude: 12.955269, longitude: 77.580558, description: short_description, location: '', city_id: city.id},
  {name: 'Fixie #12517', fix_date: now + 3.days, latitude: 12.960287, longitude: 77.642013, description: '', location: '', city_id: city.id},
  {name: 'Fixie #12518', fix_date: now + 4.days, latitude: 12.964888, longitude: 77.642785, description: '', location: '', city_id: city.id}
])

City.create([
  {name: 'Delhi'},
  {name: 'Mumbai'},
  {name: 'Kolkata'},
  {name: 'Chennai'},
  {name: 'Leh'},
  {name: 'Manail'},
  {name: 'Srinagar'},
])