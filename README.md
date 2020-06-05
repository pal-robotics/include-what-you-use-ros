# Summary
This repo has a few scripts to make using https://github.com/include-what-you-use/include-what-you-use with ROS2 a little bit easier

# Instructions
Clone repo and execute: `./build_docker.sh`

This will build a docker image with  osrf/ros2:nightly, clang-10 and include-what-you-use

Once the image is built, run it, prepare your workspace and instead of building with `colcon build` execute /ros_iwyu/do_iwyu.h

This will compile your package and determine which headers are missing or are not needed and write it to a file.
After building, you'll have the option of automatically applying them to your workspace.
