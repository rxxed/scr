#! /usr/bin/bash

curr_workspace='#b45bcf'

Color_workspace() {
    echo "%{F${curr_workspace}}"
}

Spotify() {
    SPOT=$(spotify.py)
    echo " $SPOT"
}

Volume() {
    VOL=$(ponymix get-volume)
    echo " $VOL"
}

Time() {
    TIME=$(date +%a\ %d\ %b\ %H:%M)
    echo "$TIME"
}

Bspwm() {
    desk=$(xdotool get_desktop)
    current_workspace=$(($desk + 1))
    case "$current_workspace" in
	1) echo  "$(Color_workspace)I%{F-} II III IV V VI VII VIII IX X";;
	2) echo  "I $(Color_workspace)II%{F-} III IV V VI VII VIII IX X";;
	3) echo  "I II $(Color_workspace)III%{F-} IV V VI VII VIII IX X";;
	4) echo  "I II III $(Color_workspace)IV%{F-} V VI VII VIII IX X";;
	5) echo  "I II III IV $(Color_workspace)V%{F-} VI VII VIII IX X";;
	6) echo  "I II III IV V $(Color_workspace)VI%{F-} VII VIII IX X";;
	7) echo  "I II III IV V VI $(Color_workspace)VII%{F-} VIII IX X";;
	8) echo  "I II III IV V VI VII $(Color_workspace)VIII%{F-} IX X";;
	9) echo  "I II III IV V VI VII VIII $(Color_workspace)IX%{F-} X";;
	10) echo "I II III IV V VI VII VIII IX $(Color_workspace)X%{F-}";;
    esac
}

Battery() {
    BAT=$(upower -i $(upower -e | grep 'BAT') | grep -E 'state|to\ full|percentage' | awk '/perc/{print $2}')
    echo " $BAT"
}

while true; do 
    echo -e "%{l}$(Bspwm)  %{c}$(Time) %{r}$(Spotify)   $(Volume)%   $(Battery)"
    # sleep 1
done
