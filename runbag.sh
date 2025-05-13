#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 /path/to/your_file.mcap"
  exit 1
fi

BAG_PATH="$1"

# ensure there's a host-side 'dump' directory alongside the bag file
BAG_DIR="$(dirname "$BAG_PATH")"
DUMP_DIR="$BAG_DIR/dump"
mkdir -p "$DUMP_DIR"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

docker run -it --net=bridge \
  -v "$SCRIPT_DIR/config":/root/ros2_ws/install/glim/share/glim/config \
  -v "$BAG_PATH":/bags/bag.mcap \
  -v "$DUMP_DIR":/tmp/dump \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  --device /dev/dri/card1 \
  -e DISPLAY \
  mx/glim_ros2_ext:humble
