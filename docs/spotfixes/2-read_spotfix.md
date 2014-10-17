# Read Spotfix
**Endpoint** : /spotfix/<:spotfix_id>

**Type**	 : GET

**Sample Request** : api.ugly-indian.geekd.in/spotfixes/1

**Sample Response** :
```json
{
	"spotfix_id" : 1,
	"name" : 'Fixie #31256',
	"description" : "sample description",
	"fix_date" : "2014-10-18 03:39:05",
	"latitude" : 12.9115,
	"longitude" : 77.6457,
	"city_id" : 1,
	"photos" : [ 
	{
		"user_id" : 10,
		"photo_id" : 1,
		"type" : "BEFORE",
		"image_url" : "api.ugly-indian.geekd.in/assets/photos/1/small.jpg",
		"latitude" : 12.9115 ,
		"longitude" : 77.6457,
	},
	{
		"user_id" : 10,
		"photo_id" : 2,
		"type" : "BEFORE",
		"image_url" : "api.ugly-indian.geekd.in/assets/photos/2/small.jpg",
		"latitude" : 12.9115,
		"longitude" : 77.6457,
	}
	],
	"requirements" : [
	{
		"name" : "broomsticks",
		"count" : 4,
		"description" : "can be returned after the spotfix"
	},
	{
		"name" : "people",
		"count" : 10,
		"description" : "Long sidewalk. Atleast 10 folks required"
	}
	],
	"attendees" : [
	{
		"name" : "Raison D'souza",
		"user_id" : 1,
		"fb_id" : '822220540'
	},
	{
		"name" : "Kenneth D'souza",
		"user_id" : 2,
		"fb_id" : '707975568'
	}
}
```
