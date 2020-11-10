#!/bin/zsh
# ^ this is mac os default/system shell; not the one from brew
set -e 
set -x

EXTRA_MENUS=(
    # these two are not activated by default
    "Bluetooth.menu"
    "Volume.menu"
)

# subscript for _init-macos-defaults.zsh

# check if they are really in "/System/Library/CoreServices/Menu Extras"
# because otherwise system can get stuck in infinite loop
# https://apple.stackexchange.com/a/337179
AVAILABLE_EXTRA_MENUS_PATH="/System/Library/CoreServices/Menu Extras"
AVAILABLE_EXTRA_MENUS=$(ls $AVAILABLE_EXTRA_MENUS_PATH)
CURRENT_EXTRA_MENUS=$(defaults read com.apple.systemuiserver menuExtras)

echo "adding additional icons to SystemUiServer now (icons on the top right in MacOS)"
for MENU in $EXTRA_MENUS;
do
    # -F: interpret pattern as a set of fixed strings
    # -q: quiet
    # "<<<" "here string"
    #  --> redirects string to stdin of process
    #      useful if command accepts input file name but we have a string
    #      instead of a file path
    set +x
    if grep -Fq "$MENU" <<< "$AVAILABLE_EXTRA_MENUS";
    then
        set -x
        #echo "'$MENU' is in '$AVAILABLE_EXTRA_MENUS_PATH'; great"
    else
        set -x
        echo "'$MENU' is not in '$AVAILABLE_EXTRA_MENUS_PATH'; skipped"
        continue;
    fi
    
    # -F: interpret pattern as a set of fixed strings
    # -q: quiet
    # "<<<" "here string"
    #  --> redirects string to stdin of process
    #      useful if command accepts input file name but we have a string
    #      instead of a file path
    set +x
    if grep -Fq "$MENU" <<< "$CURRENT_EXTRA_MENUS";
    then
        set -x
        echo "'$MENU' ist bereits als Menü konfiguriert"
    else
        set -x
        echo "'$MENU' appended to SystemUiServer"
        defaults write com.apple.systemuiserver menuExtras -array-add "$AVAILABLE_EXTRA_MENUS_PATH/$MENU"
    fi
done
