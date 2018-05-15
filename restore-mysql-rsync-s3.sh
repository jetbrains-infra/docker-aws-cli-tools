#!/bin/ash
set -e 

aws s3 cp s3://${BACKUP_S3_ORIGIN}/`aws s3 ls ${BACKUP_S3_ORIGIN}/${MYSQL_DUMP_LOCATION}/ --recursive | sort | tail -n 1 | awk '{print $4}'` ./latest.sql.gz
aws s3 cp s3://${BACKUP_S3_ORIGIN}/`aws s3 ls ${BACKUP_S3_ORIGIN}/${FILE_DUMP_LOCATION}/ --recursive | sort | tail -n 1 | awk '{print $4}'` ./latest.file.tar.gz

# mysql
mysql -h ${MYSQL_HOST} -u ${MYSQL_USER} --password=${MYSQL_PASSWORD} -D ${MYSQL_DB} -e "DROP DATABASE ${MYSQL_DB}; CREATE DATABASE ${MYSQL_DB}"
zcat ./latest.sql.gz | mysql -h ${MYSQL_HOST} -u ${MYSQL_USER} --password=${MYSQL_PASSWORD} ${MYSQL_DB}

# files
tar zxf latest.file.tar.gz
rsync -a -r --delete ${FILE_ORIGIN} ${FILE_DESTINATION}
aws s3 sync s3://${DATA_S3_ORIGIN} s3://${DATA_S3_DESTINATION} --delete