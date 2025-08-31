#!/bin/bash
# Caffeine toggle for Sway
# User only sets minutes; script converts to seconds automatically

# ==========================
# User configurable settings
# ==========================
LOCK_MINUTES=10      # Minutes before screen locks
SUSPEND_MINUTES=15   # Minutes before system suspends
LOCK_COLOR="000000"  # Lock screen color
LOCK_SCREEN_IMAGE="$HOME/Imagens/wallpaper"
# ==========================

# Convert minutes to seconds
LOCK_TIMEOUT=$((LOCK_MINUTES * 60))
SUSPEND_TIMEOUT=$((SUSPEND_MINUTES * 60))

# Command to start normal swayidle
# you can use if want color 'swaylock -f -c $LOCK_COLOR'
SWAYIDLE_CMD="swayidle -w \
    timeout $LOCK_TIMEOUT 'swaylock -f -i $LOCK_SCREEN_IMAGE' \ 
    timeout $SUSPEND_TIMEOUT 'systemctl suspend' \
    before-sleep 'swaylock -f -i $LOCK_SCREEN_IMAGE'"

# Check if swayidle is running
PID=$(pgrep -x swayidle)

if [ -n "$PID" ]; then
    # swayidle is running → activate caffeine mode (kill swayidle, prevent sleep)
    kill "$PID"
    notify-send "☕ Caffeine" "Caffeine mode ACTIVATED (no sleep)"
else
    # swayidle not running → deactivate caffeine mode (start swayidle normally)
    eval "$SWAYIDLE_CMD" &
    notify-send "☕ Caffeine" "Caffeine mode DEACTIVATED (sleep allowed)"
fi



