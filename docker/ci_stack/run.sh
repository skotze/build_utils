export VOLUMES_DIR=/home/osboxes/ci_volumes
export JENKINS_CONTAINER_HOSTNAME=cijenkins
export REGISTRY_CONTAINER_HOSTNAME=ciregistry
export GITLAB_CONTAINER_HOSTNAME=cigitlab
export DOCKERHOST_HOSTNAME=$(hostname)
export REGISTRY_PORT=5000
export CI_STACK_VOLUME_NAME=ci_stack_volume

mkdir -p $VOLUMES_DIR/jenkins/var/jenkins_home
mkdir -p $VOLUMES_DIR/target/
mkdir -p $VOLUMES_DIR/my_ivy_cache/

chown -R 1000 $VOLUMES_DIR/jenkins/var/jenkins_home
chown -R 1000 $VOLUMES_DIR/target/
chown -R 1000 $VOLUMES_DIR/my_ivy_cache/

docker-compose rm -a -f
docker-compose $1