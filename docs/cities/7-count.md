# Count of Spotfixes and Attendees in a City
**Endpoint** : /cities/<:city_id>/count

**Type**	 : GET

**Sample Request** : ugly-indian.geekd.in/api/cities/1/count

**Sample Response** :
```json
{
	"city_id" : 1,
	"name" : 'Bangalore',
	"count" : {
		"spotfixes" : 5,
		"attendees" : 8
	}
}
```