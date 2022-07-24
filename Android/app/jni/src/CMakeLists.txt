cmake_minimum_required(VERSION 3.6)

project(ShipOfHarkinian)

find_library(SDL2 SDL2)

add_library(main SHARED)

target_sources(main PRIVATE main.c)

target_link_libraries(main SDL2)
