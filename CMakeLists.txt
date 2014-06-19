cmake_minimum_required(VERSION 2.8.5)

project(req)
set(VERSION_MAJOR 0)
set(VERSION_MINOR 0)
set(VERSION_PATCH 0)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/Modules/")

add_subdirectory(bin)
add_subdirectory(doc)

#
# Bash Completion
#
install(FILES "${PROJECT_SOURCE_DIR}/doc/bash/req.sh"
        DESTINATION "/etc/bash_completion.d"
        PERMISSIONS OWNER_READ OWNER_WRITE
                    GROUP_READ
                    WORLD_READ
        RENAME req)

# CPack Settings
set(CPACK_GENERATOR "DEB")

set(CPACK_PACKAGE_VERSION_MAJOR "${VERSION_MAJOR}")
set(CPACK_PACKAGE_VERSION_MINOR "${VERSION_MINOR}")
set(CPACK_PACKAGE_VERSION_PATCH "${VERSION_PATCH}")
set(CPACK_PACKAGE_CONTACT "Erich Schroeter erich.schroeter+req@gmail.com")
set(CPACK_PACKAGE_DESCRIPTION "requirmenet manager based on git")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "A requirement manager based git.")
set(CPACK_PACKAGE_FILE_NAME "${CMAKE_PROJECT_NAME}-${VERSION_MAJOR}.${VERSION_MINOR}.${CPACK_PACKAGE_VERSION_PATCH}")
set(CPACK_SOURCE_PACKAGE_FILE_NAME "${CMAKE_PROJECT_NAME}-${VERSION_MAJOR}.${VERSION_MINOR}.${CPACK_PACKAGE_VERSION_PATCH}")

# Debian specific settings
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Erich Schroeter")

include(CPack)
