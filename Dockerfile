FROM osrf/ros2:nightly
RUN apt-get update && apt-get -y install clang-10 libclang-10-dev
RUN git clone https://github.com/include-what-you-use/include-what-you-use.git -b clang_10
RUN mkdir build && cd build && cmake -G "Unix Makefiles" -DCMAKE_PREFIX_PATH=/usr/lib/llvm-10 ../include-what-you-use && make -j
RUN mkdir /ros_iwyu/
COPY do_iwyu.sh generate_ros_iwyu_mappings.sh default_ros.imp /ros_iwyu/

