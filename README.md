# NavalTweetSender

This is a simple demonstration of searching and filtering tweets by a user using public twitter API. Once, the tweets are fetched, we filter the desired tweets and send it as a message using WHATSAPP API. 
This allows us to automatically share the tweets that we most follow without devoting too much time on it. 

# Sending the latest tweet of a user once a day. 

To run the bash file daily, edit `crontab -e` and add  `30 7 * * * <bashfilename>`. The frequency can be adjusted 
