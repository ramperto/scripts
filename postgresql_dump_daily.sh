#!/bin/bash
pg_dump -h 127.0.0.1 -U your_user -d your_db_name > ~/db_dump/daily/dump_$(date '+%F').tar


#delete after 7 days old
find ~/db_dump/daily/ -name 'dump_*' -mtime +7 -delete

# Use cron job to run this script daily
# ex: 0 4 * * * ./dump_daily.sh
# will run script every 04:00 AM every day
