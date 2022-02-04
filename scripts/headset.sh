#/bin/bash
pacmd set-card-profile alsa_card.pci-0000_00_1f.3-platform-skl_hda_dsp_generic off
pacmd set-card-profile alsa_card.usb-Yamaha_Corporation_Steinberg_UR22mkII-00 output:analog-stereo+input:analog-stereo;
