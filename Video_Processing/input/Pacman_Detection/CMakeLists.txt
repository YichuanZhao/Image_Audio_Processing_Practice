cmake_minimum_required(VERSION 2.8)
project( p1b )

set(OpenCV_DIR "/home/yichuan/Apps/opencv-3.2.0/release/")

find_package( OpenCV REQUIRED)
add_executable(p1b p1b.cpp)
target_link_libraries( p1b ${OpenCV_LIBS})




