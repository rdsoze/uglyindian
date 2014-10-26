# Create Spotfix
**Endpoint** : /spotfixes

**Type**	 : POST

**Sample Request** : ugly-indian.geekd.in/api/spotfixes
```json
{
	"name" : 'Fixie #31256',
	"description" : "sample description",
	"fix_date" : "2014-10-18 07:00:00",
	"latitude" : 12.9115,
	"longitude" : 77.6457,
	"city_id" : 1,
	"photos" : [ 
	{
		"user_id" : 10,
		"type" : "BEFORE",
		"image" : <imagedata>,
		"latitude" : 12.9115 ,
		"longitude" : 77.6457
	},
	{
		"user_id" : 10,
		"type" : "BEFORE",
		"image" : <imagedata>,
		"latitude" : 12.9115,
		"longitude" : 77.6457
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
	]
}
```

**Sample Response** :
```json
{
	"success" : true,
	"spotfix_id": 2
}
```
