#!/usr/bin/sh
[[ -d ~/Music/playlists ]] && echo  "~/Music/playlists already exist" || mkdir "~/Music/playlists";
[[ -d ~/.cache/mpd ]] && echo  "~/.cache/mpd already exist" || mkdir "~/.cache/mpd";
[[ -f ~/.cache/mpd/database ]] && echo "~/.cache/mpd/database already exist" || mkdir "~/.cache/mpd/database";

