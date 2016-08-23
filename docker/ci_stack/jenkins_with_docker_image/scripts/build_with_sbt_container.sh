#sudo is required to start containers by the "jenkins" user
set -x
sudo docker run -i --rm \
 --volumes-from $CI_STACK_VOLUME_NAME \
 --env TARGET_DIRECTORY="$WORKSPACE/target" \
 --env GIT_URL="https://github.com/skotze/" \
 --env GIT_REPO="testrepo" \
 --name build_in_jenkins-$BUILD_TAG $DOCKERHOST_HOSTNAME:$REGISTRY_PORT/build_in_jenkins_image:latest

#sudo docker pull ubuntu
#sudo docker tag ubuntu $DOCKERHOST_HOSTNAME:5000/helloworld:$BUILD_NUMBER
#sudo docker tag $DOCKERHOST_HOSTNAME:5000/helloworld:$BUILD_NUMBER $DOCKERHOST_HOSTNAME:5000/helloworld:latest
#sudo docker push $DOCKERHOST_HOSTNAME:5000/helloworld:latest