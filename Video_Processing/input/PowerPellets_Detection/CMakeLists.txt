cmake_minimum_required(VERSION 2.8)
project( p2a )

set(OpenCV_DIR "/home/yichuan/Apps/opencv-3.2.0/release/")

find_package( OpenCV REQUIRED)
add_executable(p2a p2a.cpp)
target_link_libraries( p2a ${OpenCV_LIBS})




