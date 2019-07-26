#!/bin/bash
text=""

site=https://YOUR_API_SITE
BOT_TOKEN=bot_YOUR_BOT_TOKEN_API
CHAT_ID=YOUR_CHAT_ID

# output example:
# {
#   "status" : "success",
#   "payload" : {
#      "en" : "Success",
#      "code" : "success"
#   },
#   "statusCode" : 200
# }

# we are going to retrieve response status and the code
# if you want to get response code from usual sites you can use this:
# curl -s -i https://ramperto.github.io | grep HTTP | awk '{print $2}'
# using my personal git page for reference

response="$(curl -s $site | json_pp | grep '"status" :' | awk -F '"' '{print $4}')"
code="$(curl -s $site | json_pp | grep '"statusCode" :' | awk -F'[, \t]*' '{print $4}')"

# conditional to handle if API is down
if [ "$response" != "success"  ]
then
        text="WARNING! Your API is down with status code = $code"

# this is telegram API
        curl -G --data-urlencode "text=$text" "https://api.telegram.org/$BOT_TOKEN/sendMessage?chat_id=-$CHAT_ID"
fi
