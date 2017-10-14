# This will rename a wordpress site and change all references from the <old_site> to the <new_site>
# 
# mysql -u <username> -p -D <database> -e "SET @oldSiteName='<old_site>'; SET @newSiteName='<new_site>'; `cat wordpress_rename.sql`"
#
# To run against a docker container
#
# docker exec -i <mysql_container> mysql -u <username> -p -D <database> -e "SET @oldSiteName='<old_site>'; SET @newSiteName='<new_site>'; `cat wordpress_rename.sql`"

UPDATE wp_options SET option_value = replace(option_value, @oldSiteName, @newSiteName) WHERE option_name = "home" OR option_name = "siteurl";
UPDATE wp_posts SET guid = replace(guid, @oldSiteName, @newSiteName);
UPDATE wp_posts SET post_content = replace(post_content, @oldSiteName, @newSiteName);
UPDATE wp_posts SET post_content_filtered = replace(post_content, @oldSiteName, @newSiteName);
UPDATE wp_postmeta SET meta_value = replace(meta_value, @oldSiteName, @newSiteName);
