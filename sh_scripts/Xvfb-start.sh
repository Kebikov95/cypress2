#!/bin/bash

echo "start Xvfb"
Xvfb -screen 0 1024x768x24 :99 &
exit