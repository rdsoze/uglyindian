# Create Photo
**Endpoint** : /photos

**Type**	 : POST

**Sample Request** : api.ugly-indian.geekd.in/photos
```json
{
	"user_id" : 1,
	"spotfix_id": 1,
	"type" : "BEFORE",
	"image" : <imagedata>,
	"latitude" : 12.9115 ,
	"longitude" : 77.6457
}
```

**Sample Response** :
```json
{
	"success" : true,
	"photo_id" : 1
}
```
