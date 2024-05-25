#!/bin/bash
set -e

vcs import < src/required.repos src
sudo apt-get update
rosdep update
rosdep install --from-paths src --ignore-src -y