if(NOT EXISTS "${CMAKE_ROOT}/Modules/CPack.cmake")
  message(STATUS "CPack is not found. SKIP")
  return()
endif()

set(
  CPACK_PACKAGE_VENDOR 
  "University of Cambridge Institute of Computing for Climate Science")
set(CPACK_PACKAGE_CONTACT "TODO: Jared Frazier (cscidev001@gmail.com)")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "TODO: Summary")
set(CPACK_PACKAGE_DESCRIPTION "TODO: Description")
set(CPACK_PACKAGE_VERSION_MAJOR "${CMAKE_PROJECT_VERSION_MAJOR}")
set(CPACK_PACKAGE_VERSION_MINOR "${CMAKE_PROJECT_VERSION_MINOR}")
set(CPACK_PACKAGE_VERSION_PATCH "${CMAKE_PROJECT_VERSION_PATCH}")
set(CPACK_PACKAGE_VERSION "${CMAKE_PROJECT_VERSION}")

# Explicitly set architecture 
# NOTE: `dpkg-architecture --list-known` for all debian options
if(X86)
  set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "i386")
  set(CPACK_RPM_PACKAGE_ARCHITECTURE "i686")
elseif(X86_64)
  set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "amd64")
  set(CPACK_RPM_PACKAGE_ARCHITECTURE "x86_64")
elseif(ARM)
  set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "armhf")
  set(CPACK_RPM_PACKAGE_ARCHITECTURE "armhf")
elseif(AARCH64)
  set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "arm64")
  set(CPACK_RPM_PACKAGE_ARCHITECTURE "aarch64")
elseif(PPC64LE)
  set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "ppc64el")
  set(CPACK_RPM_PACKAGE_ARCHITECTURE "ppc64le")
else()
  set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE ${CMAKE_SYSTEM_PROCESSOR})
  set(CPACK_RPM_PACKAGE_ARCHITECTURE ${CMAKE_SYSTEM_PROCESSOR})
endif()

if(CPACK_GENERATOR STREQUAL "DEB")
  set(FTORCH_PACKAGE_ARCH_SUFFIX ${CPACK_DEBIAN_PACKAGE_ARCHITECTURE})
elseif(CPACK_GENERATOR STREQUAL "RPM")
  set(FTORCH_PACKAGE_ARCH_SUFFIX ${CPACK_RPM_PACKAGE_ARCHITECTURE})
else()
  set(FTORCH_PACKAGE_ARCH_SUFFIX ${CMAKE_SYSTEM_PROCESSOR})
endif()

# Set the names of the package files that get generated 
# (e.g., FTorch-1.0.0-amd64)
set(
  CPACK_PACKAGE_FILE_NAME 
  "${CMAKE_PROJECT_NAME}-${CPACK_PACKAGE_VERSION}-${FTORCH_PACKAGE_ARCH_SUFFIX}")
set(
  CPACK_SOURCE_PACKAGE_FILE_NAME 
  "${CMAKE_PROJECT_NAME}-${CPACK_PACKAGE_VERSION}-${FTORCH_PACKAGE_ARCH_SUFFIX}")

# NOTE: not sure what the point of the component install is ...
# defaults handled by debian package are also okay... 
# NOTE: this is extra for now... rpm options
# set(CPACK_RPM_COMPONENT_INSTALL TRUE)
# set(CPACK_RPM_PACKAGE_SUMMARY ${CPACK_PACKAGE_DESCRIPTION_SUMMARY})
# set(CPACK_RPM_PACKAGE_DESCRIPTION ${CPACK_PACKAGE_DESCRIPTION})

############
#deb options
############
# NOTE:: This separates the different parts of the debian package i guess... 
# you can add a depnednecies section or you could make the package completely
# standalone... in the context of something that is not released on the debian
# store... it makes much more sense to just keep this as standalone
# set(CPACK_DEB_COMPONENT_INSTALL TRUE) 

# set(CPACK_DEBIAN_PACKAGE_PRIORITY "optional")
# set(CPACK_DEBIAN_PACKAGE_SECTION "libs")

# dependencies 
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS TRUE)
set(CPACK_COMPONENT_LIBS_REQUIRED TRUE)

# TODO: handle something about GPUs ??

include(CPack)
