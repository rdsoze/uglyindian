# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

City.delete_all()
Spotfix.delete_all()

now = DateTime.now()
large_description = "This file should contain all the record creation needed to seed the database with its default values. The data can then be loaded with the rake db:seed (or created alongside the db with db:setup). Ok let's go"
short_description = "Let's just clean it"
city = City.create(name: 'Bangalore', latitude: 12.9716, longitude: 77.5946)

Spotfix.create([
  {name: 'Fixie #12512', fix_date: now + 1.days, latitude: 12.911455 , longitude: 77.645660 , description: short_description, location: '433, 17th Cross Road, Sector 4, HSR Layout, Bengaluru, Karnataka 560102, India', city_id: city.id},
  {name: 'Fixie #12513', fix_date: now + 1.days, latitude: 12.916998 , longitude: 77.633709, description: large_description, location: '4th Avenue Street, Koramangala 1st Block, Teachers Colony, HSR Layout, Bengaluru, Karnataka 560034, India', city_id: city.id},
  {name: 'Fixie #12514', fix_date: now + 2.days, latitude: 12.919027, longitude: 77.632636 , description: short_description, location: 'Venkatapura Main Road, Koramangala 1st Block, Venkatapura, HSR Layout, Bengaluru, Karnataka 560034, India', city_id: city.id},
  {name: 'Fixie #12515', fix_date: now + 3.days, latitude: 12.916789, longitude: 77.600127, description: large_description, location: 'Bannerghatta Slip Road, New Gurappana Palya, Stage 1, BTM Layout 1, Bengaluru, Karnataka 560029, India', city_id: city.id},
  {name: 'Fixie #12516', fix_date: now + 3.days, latitude: 12.955269, longitude: 77.580558, description: short_description, location: '33, Doddamavalli, Sudhama Nagar, Bengaluru, Karnataka 560002, India', city_id: city.id},
  {name: 'Fixie #12517', fix_date: now + 3.days, latitude: 12.960287, longitude: 77.642013, description: '', location: 'Old Airport Road, ISRO Colony, Domlur, Bengaluru, Karnataka 560071, India', city_id: city.id},
  {name: 'Fixie #12518', fix_date: now + 4.days, latitude: 12.964888, longitude: 77.642785, description: '', location: '2, 16th B Main Road, Kodihalli, Bengaluru, Karnataka 560008, India', city_id: city.id}
])

City.create([
  {name: 'Delhi', latitude: 28.6353, longitude: 77.225 },
  {name: 'Mumbai', latitude: 19.076, longitude: 72.8777 },
  {name: 'Kolkata', latitude: 22.5726, longitude: 88.3639 },
  {name: 'Chennai', latitude: 13.0597, longitude: 80.2252 },
  {name: 'Leh', latitude: 34.1526, longitude: 77.5771 },
  {name: 'Manail', latitude: 32.2396, longitude: 77.1887 },
  {name: 'Srinagar', latitude: 34.0837, longitude: 74.7974 }
])