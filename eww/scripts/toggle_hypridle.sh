#!/bin/bash

# Check if Hypridle is currently active
if pgrep -x "hypridle" > /dev/null; then
    # If Hypridle is running, kill it to prevent suspend
    pkill -x "hypridle"
    echo ""

else
    # If Hypridle is not running, start it to allow suspend
    systemctl --user enable --now hypridle.service
    echo "󱀒"
fi
