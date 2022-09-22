#!/bin/bash

echo "start Xvfb"
export DISPLAY=:0
Xvfb :0 -screen 0 1024x768x24 &
google-chrome --disable-gpu --no-sandbox 
exit