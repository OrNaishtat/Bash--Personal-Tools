#!/bin/bash
touchscreen=$(xinput | grep "maXTouch" | awk -F " " ' {print $7} ' | cut -d '=' -f 2)
keyboard=$(xinput | grep "Translated Set 2 keyboard" | awk -F " " ' {print $7} ' | cut -d '=' -f 2)
touchpad=$(xinput | grep "SynPS/2 Synaptics TouchPad" | awk -F " " ' {print $6} ' | cut -d '=' -f 2)
xinput disable $keyboard
xinput disable $touchscreen
xinput disable $touchpad
