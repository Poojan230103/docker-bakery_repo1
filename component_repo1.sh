#!/usr/bin/env bash

#globals
COMPONENT_NAME=$1
TAG_TEMP=$2
TAG=${TAG_TEMP:=latest}
TEMP=$3
PUSH=${TEMP:=-NO}
IMAGE=prod-nexus.sprinklr.com:8123/intuition/${COMPONENT_NAME}:${TAG}

#NEXUS_USER=${NEXUS_USER}
#NEXUS_PASSWORD=${NEXUS_PASSWORD}
#mkdir -p /root/.pip
#cat > pip.conf << EOF
#[global]
#extra-index-url = https://${NEXUS_USER}:${NEXUS_PASSWORD}@prod-nexus.sprinklr.com/nexus/repository/spypi/simple/
#index-url = https://pypi.python.org/simple
#EOF

function usage() {
  echo "./build-component.sh <component> <docker-tag> <push?>"
  echo "component = one among  [test-component1
                                test-component2
                                test-component3]"
  echo "docker-tag = tag for the image (default latest)"
  echo "push? = YES or NO (push the image to repo)
                default:NO
                "
  exit 1
}

function ping(){
    echo "Building from docker file path::"
}
function check_component() {
   echo "COMPONENT_NAME: " ${COMPONENT_NAME}
  case ${COMPONENT_NAME} in
    test-component1)
    DOCKERFILE_PATH=./components_repo1/test-component1/Dockerfile
    ;;
    test-component2)
    DOCKERFILE_PATH=./components_repo1/test-component2/Dockerfile
    ;;
    test-component3)
    DOCKERFILE_PATH=./components_repo1/test-component3/Dockerfile
    ;;
    *)
      echo "Invalid component" && exit 1 ;;
  esac
  echo "<Building Image>
        dockerfile path ::" $DOCKERFILE_PATH/Dockerfile"
        tag             ::" ${TAG}
}


function build()
{
    docker build -t ${IMAGE} -f "${DOCKERFILE_PATH}" .
    case ${PUSH} in
    YES)
    echo "Pushing Image:: " ${IMAGE}
    docker push ${IMAGE}
    ;;
    NO)
    ;;
    *)
    echo "Invalid component" && exit 1 ;;
    esac
}

if [ "$#" < 3 ]; then
  usage
fi

check_component
build


