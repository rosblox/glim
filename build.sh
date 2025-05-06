#!/bin/bash

docker build -f docker/ubuntu/Dockerfile_ext.gcc -t mx/glim_ros2_ext:humble .
