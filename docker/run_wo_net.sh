#!/bin/bash
xhost + local:root

docker run -it --rm \
           -e DISPLAY=$DISPLAY \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           -v $(realpath ..):/root/catkin_ws/src/clins \
           $@ \
           clins
