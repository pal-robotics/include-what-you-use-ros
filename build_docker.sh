#!/bin/bash

docker build . -t iwyu

echo "docker image ready with name iwyu"
echo "Run it, set up the environment required to compile you package and from the root of your workspace run /ros_iwyu/do_iwyu.sh"
