cmake_minimum_required(VERSION 3.15)
project(cc65 C)

include(GNUInstallDirs)

set(CC65_BASE_DIR "cc65" CACHE PATH "The base directory (within CMAKE_INSTALL_DATAROOTDIR to install to")

if(IS_ABSOLUTE CC65_BASE_DIR)
    set(CC65_FULL_BASE_DIR "${CC65_BASE_DIR}")
else()
    set(CC65_FULL_BASE_DIR "${CMAKE_INSTALL_FULL_DATAROOTDIR}/${CC65_BASE_DIR}")
endif()


add_subdirectory(src)