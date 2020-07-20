source $HOME/.token

# Get app access token
TOKEN=$(curl --silent -H "Content-Type: application/json" -X POST 'https://id.twitch.tv/oauth2/token?client_id='$TWITCH_CLIENT_ID'&client_secret='$TWITCH_CLIENT_SECRET'&grant_type=client_credentials')
# Filter followers
TOKEN=$(echo $TOKEN | jq '.access_token' | sed -e "s/^\"\(.*\)\"/\1/")

# Get first follower in follower list
DATE=$(curl --silent -H 'Client-ID: '${TWITCH_CLIENT_ID} \-H 'Authorization: Bearer '${TOKEN} \-X GET 'https://api.twitch.tv/helix/streams?user_login=thra1zz' )
# Get the name of the follower and cut away double quotes

echo $DATE
