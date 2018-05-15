# aws-cli-tools

Kinda a swiss knife for various tasks using aws-cli.

## mysqldump-to-s3

To dump RDS databases and put the result to S3.

There are enviromental variables to set:
* DATABASE_HOST
* DATABASE_USERNAME
* DATABASE_PASSWORD
* DATABASE_NAME
* S3_BUCKET

To run:
```
docker run [opts] [env_vars] jetbrainsinfra/aws-cli-tools /mysqldump-to-s3.sh 
```

## s3

To sync data to S3.

There are enviromental variables to set:
* ORIGIN
* DESTINATION

To run:
```
docker run [opts] [env_vars] jetbrainsinfra/aws-cli-tools /s3.sh 
```

## restore-mysql-rsync-s3.sh

To restore combined backup from various places.

There are enviromental variables to set:
* MYSQL_HOST
* MYSQL_DB
* MYSQL_USER
* MYSQL_PASSWORD
* MYSQL_DUMP_LOCATION
* FILE_DUMP_LOCATION
* FILE_ORIGIN
* FILE_DESTINATION
* BACKUP_S3_ORIGIN
* DATA_S3_ORIGIN
* DATA_S3_DESTINATION

To run:
```
docker run [opts] [env_vars] jetbrainsinfra/aws-cli-tools /restore-mysql-rsync-s3.sh 
```
