last_id=""

while true; do
    id=$(xdotool getactivewindow)

    if [ -z "$last_id" ] || [ "$last_id" != "$id" ]; then
        i3-msg border pixel 1
        sleep 0.2
        last_id=$id
    else
        i3-msg border none
    fi
done
