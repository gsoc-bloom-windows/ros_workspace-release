include(vcpkg_common_functions)

set(VCPKG_BUILD_TYPE release)

vcpkg_from_github(

    OUT_SOURCE_PATH SOURCE_PATH
    REPO gsoc-bloom-windows/ros_workspace-release
    REF vcpkg/ros-dashing-ros-workspace_0.7.1-2_10
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        -DCMAKE_INSTALL_PREFIX=c:\opt\rosdashing
        -DCMAKE_PREFIX_PATH=c:\opt\rosdashing
)

vcpkg_install_cmake()

file(INSTALL ${SOURCE_PATH}/license.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/ros-dashing-ros-workspace RENAME copyright)
file(INSTALL ${SOURCE_PATH}/include/ros-dashing-ros-workspace_for_vcpkg.h DESTINATION ${CURRENT_PACKAGES_DIR}/include)

