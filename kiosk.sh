#!/bin/bash

URL="http://127.0.0.1"
xset s noblank
xset s off
xset -dpms

sed -i s/exited_cleanly:false/exited_cleanly:true/ /home/manatech/.config/chromium/Default/Preferences
sed -i s/exit_type:Crashed/exit_type:Normal/ /home/manatech/.config/chromium/Default/Preferences
