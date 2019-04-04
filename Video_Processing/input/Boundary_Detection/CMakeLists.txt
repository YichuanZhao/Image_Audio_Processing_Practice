cmake_minimum_required(VERSION 2.8)
project( p1a )

set(OpenCV_DIR "/home/yichuan/Apps/opencv-3.2.0/release/")

find_package( OpenCV REQUIRED)
add_executable(p1a p1a.cpp)
target_link_libraries( p1a ${OpenCV_LIBS})




