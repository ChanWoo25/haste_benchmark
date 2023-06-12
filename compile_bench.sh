#! /bin/bash

cmake -B build -S . -D CMAKE_BUILD_TYPE=Release -D GUI=false
cmake --build build --target tracking_app_file
