#!/bin/bash
# Turns off a power saving protocol in the system
# This tends to fix the "screen dimms after 15 minutes" problem.
# Note: Comments say this occasionally will turn itself back on, so it's a safe bet to run this before starting movies
# Added a second xset setting, said to fix this as well.

xset s off
xset -dpms
