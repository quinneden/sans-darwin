#!/usr/bin/env bash

# Dependencies:
# - libnotify: notify-send
# - slurp: slurp
# - wayshot: wayshot
# - swappy: swappy
# - wl-clipboard: wl-copy

SCREENSHOTS="$HOME/Pictures/Screenshots"
TARGET="$SCREENSHOTS/$(date '+%Y-%m-%d_%H-%M-%S').png"
FM="${FILE_MANAGER:-nautilus}"

# Parse arguments
full=false
while [[ $# -gt 0 ]]; do
    case $1 in
        -f|--full)
            full=true
            shift
            ;;
        -h|--help)
            echo "Usage: $0 [--full|-f]"
            echo "  --full|-f: Take fullscreen screenshot (default: selection)"
            exit 0
            ;;
        *)
            shift
            ;;
    esac
done

# Create screenshots directory
mkdir -p "$SCREENSHOTS"

# Take screenshot
if $full; then
    wayshot -f "$TARGET"
else
    wayshot -f "$TARGET" -s "$(slurp)"
fi

# Copy to clipboard
wl-copy < "$TARGET"

# Send notification with actions
res=$(notify-send \
    -a "Screenshot" \
    -i "image-x-generic-symbolic" \
    -h "string:image-path:$TARGET" \
    -A "file=Show in Files" \
    -A "view=View" \
    -A "edit=Edit" \
    "Screenshot Taken" \
    "$TARGET")

# Handle action response
case "$res" in
    file)
        exec "$FM" "$SCREENSHOTS"
        ;;
    view)
        xdg-open "$TARGET"
        ;;
    edit)
        swappy -f "$TARGET"
        ;;
    *)
        exit 0
        ;;
esac