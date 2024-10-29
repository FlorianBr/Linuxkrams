#!/usr/bin/env sh

model=$(lspci | grep -i Radeon | sed -ne 's/.*Radeon/Radeon/;s/].*//p')

# GPU temp
temp=$(sensors | awk '/junction/ {print $2}' | tr -d '+°C')
if [ -z "$temp" ]; then
    temp="N/A"
fi

# Fan speed
fan=$(sensors amdgpu-pci-0300 | awk '/fan1/ {print $2}')


# map icons
set_ico="{\"thermo\":{\"0\":\"󱃃\",\"45\":\"󰔏\",\"65\":\"󱃂\",\"85\":\"󰸁\"},\"util\":{\"0\":\"󰾆\",\"30\":\"󰾅\",\"60\":\"󰓅\",\"90\":\"󰀪\"}}"
eval_ico() {
    map_ico=$(echo "${set_ico}" | jq -r --arg aky "$1" --argjson avl "$2" '.[$aky] | keys_unsorted | map(tonumber) | map(select(. <= $avl)) | max')
    echo "${set_ico}" | jq -r --arg aky "$1" --arg avl "$map_ico" '.[$aky] | .[$avl]'
}

thermo=$(eval_ico thermo $temp)
# speedo=$(eval_ico util $utilization)

# TODO:
# Model
# Memory

# Print gpu info (json)
echo "{\"text\":\"${thermo} ${temp}°C\", \"tooltip\":\"${model}\n${thermo} Temperature: ${temp}°C\n  Fan Speed: ${fan} RPM\"}"