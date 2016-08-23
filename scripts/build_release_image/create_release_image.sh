#$1 = directory in which the .tgz artefact is to be found
#$2 the label we want to attach to the created image
#sample usage:
#./create_in_jenkins.sh ~/ci_volumes/jenkins/var/jenkins_home/workspace/compile_and_test/target/universal play-java-intro:1.0-SNAPSHOT
#############################
#Sample jenkins call:
#cd build_utils/scripts/build_release_image
#PROJECT_NAME="play-java-intro"
#ARTEFACT_DIR=$WORKSPACE/target/universal
#ARTEFACT_NAME=$(ls $ARTEFACT_DIR/*.tgz | xargs -n1 basename)
#ARTEFACT_VERSION=$(echo $ARTEFACT_NAME | sed s/\.tgz\// | sed s/$PROJECT_NAME//)
#./create_release_image.sh $WORKSPACE/target/universal play-java-intro:1.0-SNAPSHOT


TGZ_ARTEFACT=$(ls $1/*.tgz)
RELEASE_ARTEFACT_NAME=$(echo $TGZ_ARTEFACT | sed s/\.tgz\//)

set -x
sudo docker pull $DOCKERHOST_HOSTNAME:$REGISTRY_PORT/java8_base:latest
sudo docker tag $DOCKERHOST_HOSTNAME:$REGISTRY_PORT/java8_base:latest java8_base:latest
cp $1/TGZ_ARTEFACT .

sudo docker build --build-arg archive=$RELEASE_ARTEFACT_NAME -t $2 .






