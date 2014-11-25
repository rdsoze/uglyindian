# Spotfixes in a City
**Endpoint** : /users/<:user_id>/spotfixes

**Type**	 : GET

**Sample Request** : ugly-indian.geekd.in/api/users/1/spotfixes

**Sample Response** :
```json
[
{
	"spotfix_id" : 1,
	"name" : 'Fixie #31256',
	"description" : "sample description",
	"fix_date" : "2014-10-18 07:00:00",
	"latitude" : 12.9115,
	"longitude" : 77.6457,
	"city_id" : 1,
},
{
	"spotfix_id" : 4,
	"name" : 'Fixie #31258',
	"description" : "sample description",
	"fix_date" : "2014-10-19 06:00:00",
	"latitude" : 12.9215,
	"longitude" : 77.6557,
	"city_id" : 2,
}
]
```