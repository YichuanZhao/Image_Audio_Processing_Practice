cmake_minimum_required(VERSION 2.8)
project( p4 )

set(OpenCV_DIR "/home/yichuan/Apps/opencv-3.2.0/release/")

find_package( OpenCV REQUIRED)
add_executable(p4 p4.cpp)
target_link_libraries( p4 ${OpenCV_LIBS})




