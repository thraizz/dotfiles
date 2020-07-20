#!/bin/python3
import subprocess

playlists = \
[
    {
        "name": "beats to think to",
        "uri": "spotify:playlist:37i9dQZF1DXa2SPUyWl8Y5",
        "mood": "focus"
    },
    {
        "name": "noisia dnb",
        "uri": "spotify:playlist:7wC2oLfjXdswaypKpb8bMB",
        "mood": "focus"
    },
    {
        "name": "lofi",
        "uri": "spotify:playlist:0vvXsWCC9xrXsKd4FyS8kM",
        "mood": "chill"
    },
    {
        "name": "state of jazz",
        "uri": "spotify:playlist:37i9dQZF1DX7YCknf2jT6s",
        "mood": "hype"
    },
    {
        "name": "electro hype",
        "uri": "spotify:playlist:2yIbqOYiii8qZZ8J0p7SPL",
        "mood": "hype"
    },
    {
        "name": "this is: In Flames",
        "uri": "spotify:playlist:37i9dQZF1DX02K7tGvsG8t",
        "mood": "heavy metal"
    },
    {
        "name": "discover weekly",
        "uri": "spotify:playlist:37i9dQZEVXcJIWs4KkSa8d",
        "mood": "unknown"
    },
    {
        "name": "Add new playlist..."
    }
]

podcasts = \
[
    {
        "name": "Das Podcast Ufo",
        "uri": "spotify:show:4If94mSNbVPvMomSNUfWUw"
    },
    {
        "name": "Podcast ohne Namen",
        "uri": "spotify:show:337WgqUhBAcKQwlA2MZJtu"
    },
    {
        "name": "Almost Daily",
        "uri": "spotify:show:4jk8TbGSjoQUMAphods5sy"
    },
    {
        "name": "Daily Podcasts",
        "uri": "spotify:playlist:37i9dQZF1EnOBYmteT8p3O"
    },
    {
        "name": "Add new podcast..."
    }
]

options = \
[
    {
        "name": "playlists"
    },
    {
        "name": "podcasts"
    },
    {
        "name": "favorites"
    }
]

favorites = \
[
    {
        "name": "GANG GANG - JACKBOYS",
        "uri" :"spotify:track:6uJONCdr2rC65BNmCnTBWK"
    },
    {
        "name": "Sony Pictures - Shindy",
        "uri": "spotify:track:4PU3QFQOlTWnSnpDCIbQtO"
    },
    {
        "name": "Fokus auf die Zukunft - Ufo361",
        "uri": "spotify:track:04e7gxVx4zMzgQ589bMMim"
    },
    {
        "name": "I Am Above - In Flames",
        "uri": "spotify:track:2t1G0rDxUY9zjML3f5mObb"
    },
    {
        "name": "Pink Panther",
        "uri": "spotify:track:2r4wcCaKHrsNrirk1BkkdL"
    },
    {
        "name": "Add new favorite...",
        "uri": ""
    }
]



def callRofi(arr, key="", title="Pick one"):
    res = ""
    if key!="":
        for item in arr:
            res = res+item[key]+"\n"
    else:
        for item in arr:
            res = res+item+"\n"
    rofi =  'rofi -width 600 -location 0 -dmenu -p "{}" -padding 20 -line-margin 10'.format(title)
    c = "echo -e \"{}\" | {} -dmenu".format(res, rofi)
    proc = subprocess.Popen(c, shell=True,stdout=subprocess.PIPE)
    choice = proc.stdout.readline().decode("UTF-8")
    return choice[:-1]

choice = callRofi(options, "name")

if(choice == "playlists"):
    choice  = callRofi(playlists, "name", "Pick playlist")
    if(choice != "Add new playlist..."):
        for playlist in playlists:
            if playlist["name"] == choice:
                subprocess.Popen("playerctl open --player=spotify {}".format(playlist["uri"]), shell=True)
if(choice == "podcasts"):
    choice = callRofi(podcasts, "name", "Pick podcast")
    if(choice != "Add new podcast..."):
        for podcast in podcasts:
            if podcast["name"] == choice:
                subprocess.Popen("playerctl open --player=spotify {}".format(podcast["uri"]), shell=True)
    else:
        pass
if(choice == "favorites"):
    choice  = callRofi(favorites, "name", "Pick favorite")
    if(choice != "Add new favorite..."):
        for favorite in favorites:
            if favorite["name"] == choice:
                subprocess.Popen("playerctl open --player=spotify {}".format(favorite["uri"]), shell=True)
