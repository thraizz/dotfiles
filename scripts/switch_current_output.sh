#/bin/bash
pacmd list-sources | grep -q "Steinberg UR22mkII"
if [ $? -eq 0 ]; then
  bash -c $HOME/scripts/speakers.sh
else
  bash -c $HOME/scripts/headset.sh
fi

