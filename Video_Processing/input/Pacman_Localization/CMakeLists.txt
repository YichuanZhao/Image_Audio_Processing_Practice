cmake_minimum_required(VERSION 2.8)
project( p3a )

set(OpenCV_DIR "/home/yichuan/Apps/opencv-3.2.0/release/")

find_package( OpenCV REQUIRED)
add_executable(p3a p3a.cpp)
target_link_libraries( p3a ${OpenCV_LIBS})




