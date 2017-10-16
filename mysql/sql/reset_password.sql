# This will change the WordPress password to <password> for <username>
#
# mysql -u <username> -p -D <database> -e "SET @oldUsername='<old_username>'; SET @password='<password>'; `cat reset_password.sql`"
#
# To run against a docker container
#
# docker exec -i <mysql_container> mysql -u <username> -p -D <database> -e "SET @password='<password>'; SET @username='<username>'; `cat reset_password.sql`"

UPDATE wp_users SET user_pass = MD5( @password ) WHERE user_login = @username;