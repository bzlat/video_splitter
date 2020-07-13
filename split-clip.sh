#!/usr/bin/env bash

A=0
DURATION="${ffprobe -v error -show entries format=duration -of default=noprint_wrappers=1:nokey=1 cars_timecode.mp4}"
DURATION=${DURATION%.*}
CLIP_LENGT=10

while [ $A -le $DURATION ]; do
	ffmpeg -ss $A -i cars_timecode.mp4 -t $CLIP_LENGTH -c:v copy output-${A}.mp4
	let "A=A+${CLIP_LENGTH}"
done

