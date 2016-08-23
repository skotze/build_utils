#sample usage:
#./create_in_jenkins.sh ~/ci_volumes/jenkins/var/jenkins_home/workspace/compile_and_test/target/universal/ play-java-intro-1.0-SNAPSHOT play-java-intro:1.0-SNAPSHOT
set -x
sudo docker pull $DOCKERHOST_HOSTNAME:$REGISTRY_PORT/java8_base:latest
sudo docker tag $DOCKERHOST_HOSTNAME:$REGISTRY_PORT/java8_base:latest java8_base:latest
cp $1/$2.tgz .

sudo docker build --build-arg archive=$2 -t $3 .


#git clone https://github.com/skotze/testrepo
#cd testrepo/devstackimage/compose/ci_stack/project_images/release_image
#/scripts/create_in_jenkins.sh ../target/universal/ play-java-intro-1.0-SNAPSHOT play-java-intro:1.0-SNAPSHOT




