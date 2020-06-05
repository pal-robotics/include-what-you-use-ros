#!/bin/bash

IWYU_FILE=/tmp/iwyu.out
/ros_iwyu/generate_ros_iwyu_mappings.sh foxy > /ros_iwyu/ros_msg.imp
CC="clang-10" CXX="clang++-10" colcon build --cmake-args -DCMAKE_CXX_INCLUDE_WHAT_YOU_USE="/build/bin/include-what-you-use;-Xiwyu;any;-Xiwyu;iwyu;-Xiwyu;--mapping_file=/ros_iwyu/default_ros.imp"  2> $IWYU_FILE 

read -p "Apply suggestions? [yN]" answ
if [ "$answ" != "y" ]; then
	echo "Suggestions are at $IWYU_FILE"
	exit
fi


python3 /include-what-you-use/fix_includes.py --reorder --nosafe_headers --ignore_re="/opt/ros/.*"  < $IWYU_FILE

