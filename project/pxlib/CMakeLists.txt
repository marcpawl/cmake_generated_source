cmake_minimum_required (VERSION 3.12)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_BUILD_WITH_INSTALL_RPATH ON)
add_library( pxlib STATIC /project/px/build/generated.cpp)

set_target_properties(pxlib PROPERTIES CXX_STANDARD 17)

add_dependencies(pxlib px_all)

