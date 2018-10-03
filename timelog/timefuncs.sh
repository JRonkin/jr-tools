hours2seconds() {
	bc <<< "scale = 0; ${1} * 3600 / 1"
}

seconds2hours() {
	bc <<< "scale = 3; ${1} / 3600"
}

time2epoch() {
	date -ju -f "%H:%M:%S" "$1" "+%s" || date -ju -f "%H:%M" "$1" "+%s"
}

datetime2epoch() {
	date -ju -f "%Y-%m-%d %H:%M:%S" "$1" "+%s"
}

epoch2time() {
	date -ju -f "%s" "$1" "+%H:%M:%S"
}

epoch2date() {
	date -ju -f "%s" "$1" "+%Y-%m-%d"
}

epoch2datetime() {
	date -ju -f "%s" "$1" "+%Y-%m-%d %H:%M:%S"
}

formattime() {
	epoch2time "$(time2epoch "$1")"
}

timediff() {
	echo "$(( $(time2epoch "$1") - $(time2epoch "$2") ))" | cut -d - -f 2
}

timeaddseconds() {
	epoch2time "$(( $(time2epoch "$1") + "$2" ))"
}

timeaddhours() {
	timeaddseconds "$1" "$(hours2seconds "$2")"
}