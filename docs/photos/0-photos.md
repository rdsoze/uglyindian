##Photos

```sql
CREATE TABLE `photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spotfix_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` enum('BEFORE', 'AFTER') COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci
```

## A photo
* is uploaded by one user
* belongs to a spotfix
* belongs to a city