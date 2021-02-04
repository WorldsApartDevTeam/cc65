include(GNUInstallDirs)


set(CC65_BUILD_TARGETS "wc65c816-snes-xo65" "wc65c816-snesdev-xo65" "6502-nes-xo65")

set(CC65_TOOLS ar65 ca65 ld65)

foreach(build_target ${CC65_BUILD_TARGETS})
    foreach(tool ${CC65_TOOLS})
        message(STATUS "Creating symbolic link $ENV{DESTDIR}${CMAKE_INSTALL_FULL_BINDIR}/${build_target}-${tool}")
        file(CREATE_LINK ${tool} $ENV{DESTDIR}${CMAKE_INSTALL_FULL_BINDIR}/${build_target}-${tool} SYMBOLIC)
    endforeach()
endforeach()

foreach(build_target ${CC65_BUILD_TARGETS})
    message(STATUS "Creating symbolic link $ENV{DESTDIR}${CMAKE_INSTALL_FULL_BINDIR}/${build_target}-as")
    file(CREATE_LINK ca65 $ENV{DESTDIR}${CMAKE_INSTALL_FULL_BINDIR}/${build_target}-as SYMBOLIC)
    message(STATUS "Creating symbolic link $ENV{DESTDIR}${CMAKE_INSTALL_FULL_BINDIR}/${build_target}-ld")
    file(CREATE_LINK ld65 $ENV{DESTDIR}${CMAKE_INSTALL_FULL_BINDIR}/${build_target}-ld SYMBOLIC)
    message(STATUS "Creating symbolic link $ENV{DESTDIR}${CMAKE_INSTALL_FULL_BINDIR}/${build_target}-ar")
    file(CREATE_LINK ar65 $ENV{DESTDIR}${CMAKE_INSTALL_FULL_BINDIR}/${build_target}-ar SYMBOLIC)
endforeach()