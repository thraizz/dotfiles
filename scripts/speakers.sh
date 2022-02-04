#!/bin/bash

pacmd set-card-profile alsa_card.usb-Yamaha_Corporation_Steinberg_UR22mkII-00 off;
pacmd set-card-profile alsa_card.pci-0000_00_1f.3-platform-skl_hda_dsp_generic HiFi;
pacmd set-default-sink alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp__sink;
