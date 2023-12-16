#!/usr/bin/bash

DIRECTORY=/var/lib/noise-detection
MAX_VOLUME=75
RECORD_SECONDS=10
MICROPHONE=dsnoop:1,0

while read -n 54
do
    read -n 2 volume

    if [[ $volume > $MAX_VOLUME ]]
    then
        break
    fi

    read -n 1

done < <(arecord -D $MICROPHONE -f S16_LE -r 44100 -q --vumeter=mono /dev/null 2>&1)

datetime=`date +%F_%H-%M-%S`
record=$DIRECTORY/$datetime.wav
message="ND $datetime"

arecord -D $MICROPHONE -f S16_LE -r 44100 -q -d $RECORD_SECONDS $record
echo "$message" | s-nail -A cuenta-correo -s "$message" -a $record usuario@example.com
