cmake_minimum_required(VERSION 2.8)
project( p5b )

set(OpenCV_DIR "/home/yichuan/Apps/opencv-3.2.0/release/")

find_package( OpenCV REQUIRED)
add_executable(p5b p5b.cpp)
target_link_libraries( p5b ${OpenCV_LIBS})




