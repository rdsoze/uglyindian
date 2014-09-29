# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

now = DateTime.now()
Spotfix.create([
{fix_date: now + 1.days, latitude: 12.911455 , longitude: 77.645660 , description: 'Fixie 1', location: '', city: 'Bangalore'},
  {fix_date: now + 1.days, latitude: 12.916998 , longitude: 77.633709, description: 'Fixie 2', location: '', city: 'Bangalore'},
  {fix_date: now + 2.days, latitude: 12.919027, longitude: 77.632636 , description: 'Fixie 3', location: '', city: 'Bangalore'},
  {fix_date: now + 3.days, latitude: 12.916789, longitude: 77.600127, description: 'Fixie 4', location: '', city: 'Bangalore'},
  {fix_date: now + 3.days, latitude: 12.955269, longitude: 77.580558, description: 'Fixie 5', location: '', city: 'Bangalore'},
  {fix_date: now + 3.days, latitude: 12.960287, longitude: 77.642013, description: 'Fixie 6', location: '', city: 'Bangalore'},
  {fix_date: now + 4.days, latitude: 12.964888, longitude: 77.642785, description: 'Fixie 7', location: '', city: 'Bangalore'}
])