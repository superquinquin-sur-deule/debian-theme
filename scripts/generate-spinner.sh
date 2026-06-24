#!/usr/bin/bash
set -euo pipefail
file=$1
num=$2

SPINNER_COLOR=#f6d443
SPINNER_STROKE=6
SPINNER_ARC_LENGTH=60
SPINNER_SIZE=50
SPINNER_MARGIN=3

echo "Generating spinner frame $file..."
start_angle=$((num * 12)); \
end_angle=$((start_angle + SPINNER_ARC_LENGTH)); \
bbox_max=$((SPINNER_SIZE - SPINNER_MARGIN)); \

magick \
    -size ${SPINNER_SIZE}x${SPINNER_SIZE} xc:none \
    -fill none -stroke ${SPINNER_COLOR} \
    -strokewidth ${SPINNER_STROKE} \
    -draw "arc ${SPINNER_MARGIN},${SPINNER_MARGIN} $bbox_max,$bbox_max $start_angle,$end_angle" \
    -alpha on \
    -colors 64 \
    -depth 8 \
    $file
