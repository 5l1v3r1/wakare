#!/bin/sh

sudo mkdir -p /sys/fs/cgroup/cpuset/ptgroup
echo 0 | sudo tee /sys/fs/cgroup/cpuset/ptgroup/cpuset.cpus > /dev/null
echo 0 | sudo tee /sys/fs/cgroup/cpuset/ptgroup/cpuset.mems > /dev/null

sudo cgexec -g cpuset:ptgroup perf record -e intel_pt/noretcomp=1/u --filter "filter * @ $(which $1)" $@

sudo chown $USER:$USER perf.data
