#!/bin/bash

# CPU
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

# GPU
gpu_usage=$(nvidia-smi --query-gpu=utilization.gpu,temperature.gpu --format=csv,nounits,noheader)

gpu_usage_formatted=$(echo $gpu_usage | sed 's/\([0-9]\+\), \([0-9]\+\)/\1% \2°C/g')

# RAM

ram_usage=$(free | awk '/Mem:/ {printf("%.2f%\n", $3/$2*100)}')

# Get temperature
temperature=$(cat /sys/devices/pci0000:00/0000:00:18.3/hwmon/hwmon2/temp1_input)
temperature_celsius=$((temperature / 1000))

# Combine the outputs
echo "󰍛  ${cpu_usage}% ${temperature_celsius}°C 󱡶  ${gpu_usage_formatted}    ${ram_usage}"
