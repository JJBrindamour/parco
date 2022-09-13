ICON="Vol"
if [[ $(pamixer --get-mute) == "true" ]]; then
	ICON="ﱝ"
elif [[ $(pamixer --get-volume) -eq  0 ]]; then
	ICON=""
elif [[ $(pamixer --get-volume) -lt 50 ]]; then
	ICON=""
elif [[ $(pamixer --get-volume) -ge 50 ]]; then
	ICON=""
fi

echo "$ICON  $(pamixer --get-volume)"
