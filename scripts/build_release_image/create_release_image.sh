#$1 = directory in which the .tgz artefact is to be found
#$2 the label we want to attach to the created image
#sample usage:
#./create_in_jenkins.sh ~/ci_volumes/jenkins/var/jenkins_home/workspace/compile_and_test/target/universal play-java-intro:1.0-SNAPSHOT
#############################
#Sample jenkins call:
# PROJECT_NAME="play-java-intro"
# DOCKER_IMAGE_TAG="play-java-intro:"$BUILD_TAG
# ARTEFACT_DIR=$WORKSPACE/target/universal
# ARTEFACT_NAME=$(ls $ARTEFACT_DIR/*.tgz | xargs -n1 basename)
# ARTEFACT_VERSION=$(echo $ARTEFACT_NAME | sed s/\.tgz\// | sed s/$PROJECT_NAME// | cut -c 2-)
# cd $WORKSPACE/build_utils/docker/ci_stack/project_images/release_image
# $WORKSPACE/build_utils/scripts/build_release_image/create_release_image.sh $WORKSPACE/target/universal $DOCKER_IMAGE_TAG
# #appends repo details for push
# $WORKSPACE/build_utils/scripts/docker_utils/docker_tag.sh $DOCKER_IMAGE_TAG $DOCKER_IMAGE_TAG
# $WORKSPACE/build_utils/scripts/docker_utils/docker_tag.sh $DOCKER_IMAGE_TAG play-java-intro:$ARTEFACT_VERSION
# $WORKSPACE/build_utils/scripts/docker_utils/docker_tag.sh $DOCKER_IMAGE_TAG play-java-intro:latest
# #push to registry
# $WORKSPACE/build_utils/scripts/docker_utils/docker_push.sh $DOCKER_IMAGE_TAG
# $WORKSPACE/build_utils/scripts/docker_utils/docker_push.sh play-java-intro:$ARTEFACT_VERSION
# $WORKSPACE/build_utils/scripts/docker_utils/docker_push.sh play-java-intro:latest



TGZ_ARTEFACT=$(ls $1/*.tgz | xargs -n1 basename)
RELEASE_ARTEFACT_NAME=$(echo $TGZ_ARTEFACT | sed s/\.tgz\//)

set -x
sudo docker pull $DOCKERHOST_HOSTNAME:$REGISTRY_PORT/java8_base:latest
sudo docker tag $DOCKERHOST_HOSTNAME:$REGISTRY_PORT/java8_base:latest java8_base:latest
cp $1/$TGZ_ARTEFACT .

sudo docker build --build-arg archive=$RELEASE_ARTEFACT_NAME -t $2 .








