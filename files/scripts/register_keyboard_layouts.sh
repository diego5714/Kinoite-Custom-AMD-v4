#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Your code goes here.
echo "Registering custom keyboard layout 'mod'..."

# Modify evdev.lst
sed -i '/^  us              English (US)$/a \  mod             English (US, Custom)' /usr/share/X11/xkb/rules/evdev.lst

# Modify evdev.xml
sed -i '/<\/layoutList>/i \
    <layout>\
      <configItem>\
        <name>mod</name>\
        <shortDescription>US-Custom</shortDescription>\
        <description>English (US, Custom)</description>\
        <languageList><iso639Id>eng</iso639Id></languageList>\
      </configItem>\
    </layout>' /usr/share/X11/xkb/rules/evdev.xml

echo "Custom keyboard layout 'us-custom' registered succesfully."
