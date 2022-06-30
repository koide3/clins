FROM ros:noetic

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    git wget nano unzip build-essential libomp-dev python3-pip \
    libboost-all-dev libfmt-dev libceres-dev libyaml-cpp-dev \
    libmetis-dev ros-noetic-pcl-ros ros-noetic-eigen-conversions \
    ros-noetic-angles ros-noetic-velodyne-driver ros-noetic-velodyne-pointcloud \
    ros-noetic-tf-conversions ros-noetic-eigen-conversions ros-noetic-cv-bridge \
    ros-noetic-rviz \
  && apt-get clean && rm -rf /var/lib/apt/lists/*


WORKDIR /root
# RUN git clone https://github.com/strasdat/Sophus
RUN git clone https://github.com/NikolausDemmel/Sophus.git
WORKDIR /root/Sophus
RUN git fetch --depth 1 origin eaf1e404992675a42892fa648d69d5bd933ff219
WORKDIR /root/Sophus/build
RUN cmake .. && make install -j$(nproc)

RUN mkdir -p /root/catkin_ws/src
WORKDIR /root/catkin_ws/src
RUN /bin/bash -c '. /opt/ros/noetic/setup.bash; catkin_init_workspace'

COPY . /root/catkin_ws/src/clins

WORKDIR /root/catkin_ws
RUN /bin/bash -c '. /opt/ros/noetic/setup.bash; catkin_make -DCMAKE_BUILD_TYPE=Release'

RUN sed -i "6i source \"/root/catkin_ws/devel/setup.bash\"" /ros_entrypoint.sh

WORKDIR /root/catkin_ws/src/clins

ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]
