#!/usr/bin/env bash

#globals
COMPONENT_NAME=$1
TAG_TEMP=$2
TAG=${TAG_TEMP:=1.0}
TEMP=$3
PUSH=${TEMP:=-NO}
IMAGE=poojan23/docker-bakery-system_${COMPONENT_NAME}:${TAG}


function ping(){
    echo "Building from docker file path::"
}
function check_component() {
   echo "COMPONENT_NAME: " ${COMPONENT_NAME}
  case ${COMPONENT_NAME} in
    repo1-component1)
    DOCKERFILE_PATH=./components_repo1/test-component1_repo1/Dockerfile
    ;;
    repo1-component2)
    DOCKERFILE_PATH=./components_repo1/test-component2_repo1/Dockerfile
    ;;
    repo1-component3)
    DOCKERFILE_PATH=./components_repo1/test-component3_repo1/Dockerfile
    ;;
    repo1-component4)
    DOCKERFILE_PATH=./components_repo1/test-component4_repo1/Dockerfile
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


