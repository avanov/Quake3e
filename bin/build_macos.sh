#!/usr/bin/env bash

rm -rvf ./build/release-darwin-*
make BUILD_SERVER=0 USE_RENDERER_DLOPEN=0 RENDERER_DEFAULT=opengl

# the following resources have to exist to run the game,
# but symlinks don't seem to be followed by the binary at the moment
#ln -s -f ~/Desktop/quake3res/baseq3        ~/.q3a/baseq3
#ln -s -f ~/Desktop/quake3res/missionpack   ~/.q3a/missionpack
#ln -s -f ~/Desktop/quake3res/osp           ~/.q3a/osp
