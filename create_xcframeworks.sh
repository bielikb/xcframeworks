#! /bin/sh -e
# This script demonstrates archive and create action on frameworks and libraries
#
# @author Boris Bielik

# Release dir path
OUTPUT_DIR_PATH=$1

function archivePathSimulator {
  local DIR=${OUTPUT_DIR_PATH}/archives/"${1}-SIMULATOR"
  echo "${DIR}"
}

function archivePathDevice {
  local DIR=${OUTPUT_DIR_PATH}/archives/"${1}-DEVICE"
  echo "${DIR}"
}

# Builds archive for simulator & device
function buildArchive {
  xcodebuild archive -workspace XCFrameworks.xcworkspace -scheme ${1} -destination "generic/platform=iOS Simulator" -archivePath $(archivePathSimulator $1)  SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES | xcpretty
  xcodebuild archive -workspace XCFrameworks.xcworkspace -scheme ${1} -destination "generic/platform=iOS"           -archivePath $(archivePathDevice $1)     SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES | xcpretty
}

# Creates xc framework
function createXCFramework {
  FRAMEWORK_SIMULATOR_DIR=$(archivePathSimulator $1).xcarchive/Products/Library/Frameworks
  FRAMEWORK_DEVICE_DIR=$(archivePathDevice $1).xcarchive/Products/Library/Frameworks
  xcodebuild -create-xcframework -framework ${FRAMEWORK_SIMULATOR_DIR}/${1}.framework -framework ${FRAMEWORK_DEVICE_DIR}/${1}.framework -output ${OUTPUT_DIR_PATH}/xcframeworks/${1}.xcframework
}

### Static Libraries cant be turned into frameworks
function createXCFrameworkForStaticLibrary {
  FRAMEWORK_SIMULATOR_DIR=$(archivePathSimulator $1).xcarchive/Products/usr/local/lib
  FRAMEWORK_DEVICE_DIR=$(archivePathDevice $1).xcarchive/Products/usr/local/lib
  xcodebuild -create-xcframework -library ${FRAMEWORK_SIMULATOR_DIR}/libStaticLibrary.a -library ${FRAMEWORK_DEVICE_DIR}/libStaticLibrary.a -output ${XCFRAMEWORKS_DIR_PATH}/${1}.xcframework
}

echo "#####################"
echo "▸ Cleaning the dir: ${OUTPUT_DIR_PATH}"
rm -rf $OUTPUT_DIR_PATH

#### Static Library ####
LIBRARY=StaticLibrary

echo "▸ Archiving static library"
echo "▸ Archive $LIBRARY"
buildArchive ${LIBRARY}

echo "▸ Create $FRAMEWORK.xcframework"
createXCFrameworkForStaticLibrary ${LIBRARY}

#### Dynamic Framework ####

DYNAMIC_FRAMEWORK=DynamicFramework

echo "▸ Archiving dynamic framework"
echo "▸ Archive $DYNAMIC_FRAMEWORK"
buildArchive ${DYNAMIC_FRAMEWORK}

echo "▸ Create $DYNAMIC_FRAMEWORK.xcframework"
createXCFramework ${DYNAMIC_FRAMEWORK}
