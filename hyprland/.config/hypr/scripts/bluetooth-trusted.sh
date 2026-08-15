#/bin/bash
while read -r device
do
    id=$(echo $device | awk '{print $2'})
    bluetoothctl connect $id
done <<< $(bluetoothctl devices Trusted)