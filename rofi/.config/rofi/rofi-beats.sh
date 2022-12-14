#!/bin/sh

# add more args here according to preference
ARGS="--volume=88"

notification(){
	notify-send "Playing now: " "$@" --icon=media-tape
}

menu(){
	printf "1. Lofi Radio\n"
	printf "2. Chillhop\n"
	printf "3. Box Lofi\n"
	printf "4. The Bootleg Boy\n"
	printf "5. Radio Spinner\n"
	printf "6. SmoothChill\n"
	printf "7. Lofi Girl\n"
}

main() {
	choice=$(menu | rofi -dmenu | cut -d. -f1)

	case $choice in
		1)
			notification "Lofi Radio ☕️🎶";
            URL="https://play.streamafrica.net/lofiradio"
			break
			;;
		2)
			notification "Chillhop ☕️🎶";
            URL="http://stream.zeno.fm/fyn8eh3h5f8uv"
			break
			;;
		3)
			notification "Box Lofi ☕️🎶";
            URL="http://stream.zeno.fm/f3wvbbqmdg8uv"
			break
			;;
		4)
			notification "The Bootleg Boy ☕️🎶";
            URL="http://stream.zeno.fm/0r0xa792kwzuv"
			break
			;;
		5)
			notification "Radio Spinner ☕️🎶";
            URL="https://live.radiospinner.com/lofi-hip-hop-64"
			break
			;;
		6)
			notification "SmoothChill ☕️🎶";
            URL="https://media-ssl.musicradio.com/SmoothChill"
			break
			;;
		7)
			notification "LofiGirl ☕️🎶";
						URL="https://youtu.be/jfKfPfyJRdk --no-video"
			break
			;;
	esac
    # run mpv with args and selected url
    # added title arg to make sure the pkill command kills only this instance of mpv
    mpv $ARGS --title="radio-mpv" $URL 
}

pkill -f radio-mpv || main
