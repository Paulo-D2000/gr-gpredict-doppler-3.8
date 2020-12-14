INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_GPREDICT_DOPPLER gpredict_doppler)

FIND_PATH(
    GPREDICT_DOPPLER_INCLUDE_DIRS
    NAMES gpredict_doppler/api.h
    HINTS $ENV{GPREDICT_DOPPLER_DIR}/include
        ${PC_GPREDICT_DOPPLER_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    GPREDICT_DOPPLER_LIBRARIES
    NAMES gnuradio-gpredict_doppler
    HINTS $ENV{GPREDICT_DOPPLER_DIR}/lib
        ${PC_GPREDICT_DOPPLER_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
          )

include("${CMAKE_CURRENT_LIST_DIR}/gpredict_dopplerTarget.cmake")

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(GPREDICT_DOPPLER DEFAULT_MSG GPREDICT_DOPPLER_LIBRARIES GPREDICT_DOPPLER_INCLUDE_DIRS)
MARK_AS_ADVANCED(GPREDICT_DOPPLER_LIBRARIES GPREDICT_DOPPLER_INCLUDE_DIRS)
