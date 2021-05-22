#!/usr/bin/bash

#Define the clock
Clock() {
        DATETIME=$(date "+%a %b %d, %I:%M %p")
        echo -n "$DATETIME"
}

#Define the battery
Battery() {
        BATPERC=$(cat /sys/class/power_supply/BAT0/capacity)
        echo "BAT $BATPERC%"
}

#Define the network
Network() {
        NETWORK=$(nmcli -t -f NAME connection show --active)
        echo "$NETWORK"
}

#Define the CPU usage
Cpu() {
        CPU=$(top -bn1 | grep "Cpu(s)" | \
           sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
           awk '{print 100 - $1}' | xargs printf "%.0f")
        echo "CPU $CPU%"
}

#Define the RAM usage
Ram() {
        RAM=$(free | grep Mem | awk '{print $3/$2 * 100.0}' | xargs printf "%.0f")
        echo "RAM $RAM%"
}

# Print the clock
while true; do
        echo " $(Network) %{c}$(Clock) %{r}$(Battery) $(Cpu) $(Ram) "
        sleep 1
done