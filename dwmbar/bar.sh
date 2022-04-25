#!/bin/sh

# Source the colors
# -----------------
# Numbered colors
declare -a color
for i in {0..15}
do
    color[i]=#`xrdb -query | awk '/*.color'"$i":'/ { print substr($2,2) }'`
    # echo ${color[i]}
done

# Named colors
foreground=#`xrdb -query | awk '/*.foreground/ { print substr($2,2) }'`
background=#`xrdb -query | awk '/*.background/ { print substr($2,2) }'`
# echo $foreground
# echo $background

# --------------------------------------------------------
# Battery :
# ---------
bat(){
	for battery in /sys/class/power_supply/BAT?*; do
		# If non-first battery, print a space separator.
		[ -n "${capacity+x}" ] && printf " "
		# Sets up the status and capacity
		case "$(cat "$battery/status" 2>&1)" in
			"Full") status=" " ;;
			"Discharging") status=" " ;;
			"Charging") status=" " ;;
			"Not charging") status=" " ;;
			"Unknown") status=" " ;;
			*) exit 1 ;;
		esac
		capacity="$(cat "$battery/capacity" 2>&1)"
		# Will make a warn variable if discharging and low
		[ "$status" = " " ] && [ "$capacity" -le 25 ] && warn=" "
		# Prints the info
		printf "%s%s%d%%" "^c${color[4]}^$status" "$warn" "$capacity"; unset warn
	done && printf "^d^\\n"
}

# --------------------------------------------------------
# Date and time:
# --------------
dat(){
	date="$(date +"%Y-%m-%d %T")"
	#echo -e " $date"
	echo -e "^c${color[14]}^ $date^d^"
}

# --------------------------------------------------------
# Cpu Usage :
# -----------
cpu(){
	read cpu a b c previdle rest < /proc/stat
	prevtotal=$((a+b+c+previdle))
	sleep 0.5
	read cpu a b c idle rest < /proc/stat
	total=$((a+b+c+idle))
	cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
	#echo -e " $cpu%"
	echo -e "^c${color[14]}^ $cpu%^d^" 
}

# --------------------------------------------------------
# Screen Light :
# --------------
lit(){
	lit="$(xbacklight | sed 's/\..*//g')"
	echo -e "^c${color[11]}^ $lit^d^"		
}

# --------------------------------------------------------
# Memory :
# --------
mem(){
	mem="$(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
	echo -e "^c${color[11]}^ $mem^d^"
}

# --------------------------------------------------------
# Volume :
# --------
vol(){
        curStatus=$(pactl get-sink-mute @DEFAULT_SINK@)
        vol=$(pactl get-sink-volume @DEFAULT_SINK@ | tail -n 2 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,' | head -n 1)
        if [ "${curStatus}" = 'Mute: yes' ]
        then
            icon=''
            vol=0
        else
            icon=''
        fi
	echo "^c${color[9]}^$icon $vol%^d^"
}


# --------------------------------------------------------
# Updates:
# --------
pkg_updates() {
	updates=$(checkupdates+aur|wc -l)

	if [ "$updates" == "0" ]; then
		printf "^c${color[10]}^ ^d^"
	else
		printf "^c${color[9]}^ $updates"" updates^d^"
	fi
}


# --------------------------------------------------------
# Loop:
# -----
interval=0
space=" "
cep="^c${color[9]}^|"
while true; do
  # every 1h checkupdates
  [ $interval = 0 ] || [ $(($interval % 3600)) = 0 ] && updates=$(pkg_updates) && interval=0;
  xsetroot -name "$cep$space$updates$space$(cpu)$space$(mem)$space$(vol)$space$(bat)$space$(dat)$cep$space"
  sleep 1s
  interval=$((interval + 1))
done &
