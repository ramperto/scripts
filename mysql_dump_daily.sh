DBNAME=focus
DATE=`date +"%Y%m%d"`
SQLFILE=$DBNAME-${DATE}.sql
mysqldump $DBNAME | gzip -c > /home/perto/backup/$SQLFILE.gz


#delete after >n days

find /home/perto/backup/ -name '*.gz' -mtime +n -delete

# Use cron job to run this script daily
# ex: 0 4 * * * ./dump_daily.sh
# will run script every 04:00 AM every day

