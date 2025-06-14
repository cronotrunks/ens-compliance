#!/bin/bash

# Constants
STATE_DIR="$HOME/.cache/browser_cleanup"
STATE_FILE="$STATE_DIR/last_cleanup.txt"
THREE_MONTHS_AGO=$(date -d '3 months ago' +%s)
NOW=$(date +%s)

# Creates state directory
mkdir -p "$STATE_DIR"

# Helper to detect installed browsers
detect_browsers() {
    browsers=()

    if command -v firefox &>/dev/null && [ -d "$HOME/.mozilla/firefox" ]; then
        browsers+=("firefox")
    fi
    if command -v google-chrome &>/dev/null && [ -d "$HOME/.config/google-chrome" ]; then
        browsers+=("google-chrome")
    fi
    if command -v chromium &>/dev/null && [ -d "$HOME/.config/chromium" ]; then
        browsers+=("chromium")
    fi
    if command -v brave-browser &>/dev/null && [ -d "$HOME/.config/BraveSoftware/Brave-Browser" ]; then
        browsers+=("brave")
    fi

    echo "${browsers[@]}"
}

# Helper to clean cookies
clean_cookies() {
    for browser in "${BROWSERS[@]}"; do
        case "$browser" in
            firefox)
                find "$HOME/.mozilla/firefox/" -name "cookies.sqlite" -exec sqlite3 {} "DELETE FROM moz_cookies;" \;
                ;;
            google-chrome)
                find "$HOME/.config/google-chrome" -name "Cookies" -exec sqlite3 {} "DELETE FROM cookies;" \;
                ;;
            chromium)
                find "$HOME/.config/chromium" -name "Cookies" -exec sqlite3 {} "DELETE FROM cookies;" \;
                ;;
            brave)
                find "$HOME/.config/BraveSoftware/Brave-Browser" -name "Cookies" -exec sqlite3 {} "DELETE FROM cookies;" \;
                ;;
        esac
    done
}

# Checks last clean
if [ -f "$STATE_FILE" ]; then
    LAST_CLEAN=$(date -d "$(cat $STATE_FILE)" +%s)
else
    LAST_CLEAN=0
fi

# Checks installed browsers
BROWSERS=($(detect_browsers))

# Shows message if cleaning was performed more than 3 months ago
if [ ${#BROWSERS[@]} -gt 0 ] && [ "$LAST_CLEAN" -lt "$THREE_MONTHS_AGO" ]; then
    browser_list=$(IFS=, ; echo "${BROWSERS[*]}")
    if zenity --question --title="Limpieza de Cookies" \
        --text="Se han detectado navegadores instalados con datos de usuario en tu sistema: $browser_list\n\n¿Deseas limpiar las cookies de estos navegadores?"; then
        clean_cookies
        date +"%Y-%m-%d" > "$STATE_FILE"
        zenity --info --title="Limpieza completada" --text="Las cookies han sido eliminadas correctamente."
    fi
fi
