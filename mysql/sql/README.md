# MYSQL scripts

- [Backup WordPress](#Backup WordPress Database)
- [Rename WordPress](#Rename WordPress)
- [Reset Username](#Reset Username)
- [Reset Password](#Reset Password)
- [Delete Spam](#Delete Spam Comments)
- [Unique Comment Emails](#Unique Comment Emails)

## Backup WordPress Database
```
mysqldump -u <username> -p <database> --add-drop-table | bzip2 -c > ../backups/backup-$(date $Y-$m-$d-%H.$M.$S).sql.bz2
```

## Rename WordPress
This will rename the WordPress site by replacing the old domain with a new domain.
Tables affected:  
  - wp_posts
  - wp_postmeta
  - wp_options tables 
 
```
mysql -u <username> -p -D <database> -e "SET @oldSiteName='<old_site>'; SET @newSiteName='<new_site>'; `cat wordpress_rename.sql`"
```
OR
```
docker exec -i <mysql_container> mysql -u <username> -p -D <database> -e "SET @oldSiteName='<old_site>'; SET @newSiteName='<new_site>'; `cat wordpress_rename.sql`"
```

## Reset Username
This will reset a username in WordPress changing <old_username> to <new_username>
 
```
mysql -u <username> -p -D <database> -e "SET @oldUsername='<old_username>'; SET @newUsername='<new_username>'; `cat reset_username.sql`"
```
OR
```
docker exec -i <mysql_container> mysql -u <username> -p -D <database> -e "SET @newUsername='<new_username>'; SET @oldUsername='<old_username>'; `cat reset_username.sql`"
```

## Reset Password
This will change the WordPress password to <password> for <username>
 
```
mysql -u <username> -p -D <database> -e "SET @oldUsername='<old_username>'; SET @password='<password>'; `cat reset_password.sql`"
```
OR
```
docker exec -i <mysql_container> mysql -u <username> -p -D <database> -e "SET @password='<password>'; SET @username='<username>'; `cat reset_password.sql`"
```

## Delete Spam Comments
This will delete all spam comments
```
mysql -u <username> -p -D <database> < comments_spam_delete.sql
```
OR
```
docker exec -i <mysql_container> mysql -u <username> -p -D <database> < comments_spam_delete.sql
```

## Unique Comment Emails
This will return all the unique comment email addresses
```
mysql -u <username> -p -D <database> < comment_emails.sql
```
OR
```
docker exec -i <mysql_container> mysql -u <username> -p -D <database> < comment_emails.sql
```