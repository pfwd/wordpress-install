# This will reset a username in a wordpress site from <old_username> to <new_username>
#
# mysql -u <username> -p -D <database> -e "SET @oldUsername='<old_username>'; SET @newUsername='<new_username>'; `cat reset_username.sql`"
#
# To run against a docker container
#
# docker exec -i <mysql_container> mysql -u <username> -p -D <database> -e "SET @newUsername='<new_username>'; SET @oldUsername='<old_username>'; `cat reset_username.sql`"

UPDATE wp_users SET user_login = @newUsername WHERE user_login = @oldUsername;