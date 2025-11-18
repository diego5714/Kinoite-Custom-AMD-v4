#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

echo "Registering custom keyboard layout 'us-custom'..."

# Modify evdev.lst
sed -i '/^  us              English (US)$/a \  us-custom       English (US, Custom)' /usr/share/X11/xkb/rules/evdev.lst

# Modify evdev.xml
sed -i '/<\/layoutList>/i \
    <layout>\
      <configItem>\
        <name>us-custom</name>\
        <shortDescription>US-Custom</shortDescription>\
        <description>English (US, Custom)</description>\
        <languageList><iso639Id>eng</iso639Id></languageList>\
      </configItem>\
    </layout>' /usr/share/X11/xkb/rules/evdev.xml

echo "Custom keyboard layout 'us-custom' registered succesfully."

echo "Setting 'lv3:ralt_switch' as system-wide XKB option..."

# This enables Right Alt to act as AltGr
localectl set-x11-keymap us "" "" lv3:ralt_switch

echo "System-wide keyboard options set."
