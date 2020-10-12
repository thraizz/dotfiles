#/bin/bash
pacmd list-sources | grep -q "Steinberg UR22mkII"
if [ $? -eq 0  ]; then
  echo "Output: STEINBERG"
fi
pacmd list-sources | grep -q "TU104 HD Audio Controller Digital Stereo"
if [ $? -eq 0 ]; then
  echo "Output: SPEAKERS"
fi

