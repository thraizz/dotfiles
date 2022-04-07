#!/bin/bash
source $HOME/.config/audio_variables

pacmd set-card-profile $HEADSET_CARD_UNIT off;
pacmd set-card-profile $SPEAKER_CARD_UNIT $SPEAKER_CARD_PROFILE;
pacmd set-default-sink $SPEAKER_DEFAULT_SINK;
