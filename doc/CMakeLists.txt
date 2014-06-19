set(manpages)
set(RST_SOURCES
    req.rst
    )

# Make sure directory exists so rst2man command doesn't fail
set(MAN_DIR "${PROJECT_BINARY_DIR}/doc/man")
file(MAKE_DIRECTORY "${MAN_DIR}")

foreach(rst ${RST_SOURCES})
    string(REPLACE ".rst" ".1" manpage "${MAN_DIR}/${rst}")
    add_custom_command(OUTPUT ${manpage}
        COMMAND rst2man "${PROJECT_SOURCE_DIR}/doc/${rst}" "${MAN_DIR}/${manpage}"
                DEPENDS "${rst}")
    list(APPEND manpages ${manpage})
endforeach()
add_custom_target(man DEPENDS ${manpages})
install(FILES ${manpages}
        DESTINATION share/man/man1
        PERMISSIONS OWNER_READ OWNER_WRITE
                    GROUP_READ
                    WORLD_READ)
