source $HOME/.token
TOKEN=$(curl --silent -H "Content-Type: application/json" -X POST 'https://id.twitch.tv/oauth2/token?client_id='$TWITCH_CLIENT_ID'&client_secret='$TWITCH_CLIENT_SECRET'&grant_type=client_credentials')
# Filter followers
TOKEN=$(echo $TOKEN | jq '.access_token' | sed -e "s/^\"\(.*\)\"/\1/")

viewers=$(curl --silent -H 'Client-ID: '"$TWITCH_CLIENT_ID" \-H 'Authorization: Bearer '"${TOKEN}" \-X GET 'https://api.twitch.tv/helix/streams?user_login=thra1zz' | jq -e ".data[].viewer_count")
if [ $? -eq 0 ]; then
    echo "Live"
else
    echo "Not Live"
fi

