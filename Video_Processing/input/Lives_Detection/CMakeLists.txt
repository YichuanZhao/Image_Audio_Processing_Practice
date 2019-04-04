cmake_minimum_required(VERSION 2.8)
project( p2b )

set(OpenCV_DIR "/home/yichuan/Apps/opencv-3.2.0/release/")

find_package( OpenCV REQUIRED)
add_executable(p2b p2b.cpp)
target_link_libraries( p2b ${OpenCV_LIBS})




