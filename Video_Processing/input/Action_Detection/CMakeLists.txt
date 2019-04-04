cmake_minimum_required(VERSION 2.8)
project( p5a )

set(OpenCV_DIR "/home/yichuan/Apps/opencv-3.2.0/release/")

find_package( OpenCV REQUIRED)
add_executable(p5a p5a.cpp)
target_link_libraries( p5a ${OpenCV_LIBS})




