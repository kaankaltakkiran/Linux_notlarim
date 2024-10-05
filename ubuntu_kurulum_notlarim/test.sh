#!/bin/bash

# Easy Screenshoot kısayolu ekleme
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings/custom0/name 'Easy Screenshoot'
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings/custom0/command "sh -c 'gnome-screenshot -af /home/$USER/Pictures/Screenshots/\$(date \"+%Y.%m.%d-%H.%M.%S\").png'"
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings/custom0/binding '<Primary><Shift>s'

# Guake Terminal kısayolu ekleme (F12)
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings/custom1/name 'Guake Terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings/custom1/command 'guake-toggle'
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings/custom1/binding 'F12'

# Mevcut kısayollara ekleme
existing_bindings=$(gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings)
new_bindings="['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"

# Eğer başka kısayollar varsa onları koruyarak ekleme yap
if [[ $existing_bindings != "@as []" ]]; then
    new_bindings=$(echo $existing_bindings | sed "s/]/, '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']/")
fi

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "$new_bindings"

echo "Kısayollar başarıyla eklendi!"
