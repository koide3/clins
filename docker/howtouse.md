# clins

Original repository: https://github.com/APRIL-ZJU/clins


## Build
```bash
cd clins/docker
./build.sh
```

## Run

### On host:
```bash
roscore
```

```bash
rviz -d launch/odom.rviz
```

### On docker image:

campus_small_dataset.bag: https://drive.google.com/drive/folders/1lMAXY_qN9BA1z_d0ntSBI80iow0FGpDv?usp=sharing

```bash
cd clins/docker
./run.sh -v /abs/path/to/campus_small_dataset.bag:/tmp/campus_small_dataset.bag

roslaunch clins clins_offline.launch config_name:=/config/lio-sam-bag.yaml
```

![ezgif-1-04482ff365](https://user-images.githubusercontent.com/31344317/176426451-112d0c64-63f4-46a7-9c2f-7166d8d490d3.gif)

