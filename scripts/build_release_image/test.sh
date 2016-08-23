export DOCKERHOST_HOSTNAME=osboxes
export REGISTRY_PORT=5000
./create_in_jenkins.sh ~/ci_volumes/jenkins/var/jenkins_home/workspace/compile_and_test/target/universal/ play-java-intro-1.0-SNAPSHOT play-java-intro:1.0-SNAPSHOT
