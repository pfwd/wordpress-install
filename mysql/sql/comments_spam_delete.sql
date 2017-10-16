# This will delete all spam comments
#
# mysql -u <username> -p -D <database> < comments_spam_delete.sql
#
# To run against a docker container
#
# docker exec -i <mysql_container> mysql -u <username> -p -D <database> < comments_spam_delete.sql

DELETE FROM wp_comments WHERE comment_approved = 'spam';