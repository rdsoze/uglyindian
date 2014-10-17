##Invites

```sql
CREATE TABLE `invites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `invitee_user_id` int(11) DEFAULT NULL,
  `spotfix_id` int(11) DEFAULT NULL,
  `accepted` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci
```

##A invite
* belongs to a spotfix
* belongs to a user
* belongs to a invitee 