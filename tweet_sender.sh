#!/bin/zsh
tweet1=$(curl -X GET -H "Authorization: Bearer AAAAAAAAAAAAAAAAAAAAAARQdgEAAAAAEbecLt5PiXS5bfWHxN1uRligjk8%3DtLBTnOzYJzlB31gTuFPB1rUyKJ9fj2K9IRxTvSdJI417JnjgvR"  \
"https://api.twitter.com/2/tweets/search/recent?query=from:NavalismHQ&tweet.fields=created_at" >twitter_file.json | jq '.meta' | jq '.newest_id' | tr -d '"')
tweet1=`echo "$tweet1" | tr -d '"'`
echo $tweet1
var="$(curl -X GET -H "Authorization: Bearer AAAAAAAAAAAAAAAAAAAAAARQdgEAAAAAEbecLt5PiXS5bfWHxN1uRligjk8%3DtLBTnOzYJzlB31gTuFPB1rUyKJ9fj2K9IRxTvSdJI417JnjgvR" "https://api.twitter.com/2/tweets?ids=$tweet1" | jq ".data[].text " ; echo)"
JSON_STR=$(jq -n --arg v "$var" '{ "messaging_product": "whatsapp", "to": "12065814687", "type": "text", "text": { "body": $v } }' )
echo $JSON_STR
curl -i -X POST \
  https://graph.facebook.com/v13.0/101077889310243/messages \
  -H 'Authorization: Bearer EAAFZCS86rXNoBAKLEdY0dpc4RSZAw0iZCN9CCl2k2laDh18gAUdxeWHQ5IhWmZBZBTJ5EcBGGu8aj591U32PRZBqg2e5Xvbh0RDVeZCMbO4UsWvo3M4N2SxJ15TmA2Jbs6a9ZBZBr923gd6MSAbKHt9bWH53vDRL3q8C8OP8WyDnoOAZDZD' \
  -H 'Content-Type: application/json' \
  -d $JSON_STR