#!/usr/bin/env bash

#globals
COMPONENT_NAME=$1
TAG_TEMP=$2
TAG=${TAG_TEMP:=1.0}
TEMP=$3
PUSH=${TEMP:=-NO}
IMAGE=docker-bakery-system/${COMPONENT_NAME}:${TAG}


function ping(){
    echo "Building from docker file path::"
}
function check_component() {
   echo "COMPONENT_NAME: " ${COMPONENT_NAME}
  case ${COMPONENT_NAME} in
    test-component1_repo1)
    DOCKERFILE_PATH=./components_repo1/test-component1_repo1/Dockerfile
    ;;
    test-component2_repo1)
    DOCKERFILE_PATH=./components_repo1/test-component2_repo1/Dockerfile
    ;;
    test-component3_repo1)
    DOCKERFILE_PATH=./components_repo1/test-component3_repo1/Dockerfile
    ;;
    *)
      echo "Invalid component" && exit 1 ;;
  esac
  echo "<Building Image>
        dockerfile path ::" ${DOCKERFILE_PATH}"
        tag             ::" ${TAG}
}


function build()
{
    docker build -t ${IMAGE} -f "${DOCKERFILE_PATH}" .
}


check_component
build


