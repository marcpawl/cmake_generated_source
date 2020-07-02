cmake_minimum_required (VERSION 3.12)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_BUILD_WITH_INSTALL_RPATH ON)
add_custom_target(px_all ALL
  DEPENDS /project/px/build /project/px/build/generated.cpp )
add_custom_command(
  OUTPUT /project/px/build /project/px/build/generated.cpp 
  COMMAND /project/px/generator
  MAIN_DEPENDENCY /project/px/generator
  )

