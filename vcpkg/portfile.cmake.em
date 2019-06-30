include(vcpkg_common_functions)

set(VCPKG_BUILD_TYPE release)

@[if git_source == 'gitlab']@
vcpkg_from_gitlab(
@[elif git_source == 'github']@
vcpkg_from_github(
@[elif git_source == 'bitbucket']@
vcpkg_from_bitbucket(@[end if]
    OUT_SOURCE_PATH SOURCE_PATH
    REPO @(user_name)/@(repo_name)
    REF @(tag_name)
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        -DCMAKE_INSTALL_PREFIX=@(InstallationPrefix)
        -DCMAKE_PREFIX_PATH=@(InstallationPrefix)
)

vcpkg_install_cmake()

file(INSTALL ${SOURCE_PATH}/license.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/@(Package) RENAME copyright)
file(INSTALL ${SOURCE_PATH}/include/@(Package)_for_vcpkg.h DESTINATION ${CURRENT_PACKAGES_DIR}/include)

