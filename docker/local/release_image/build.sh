cp /home/osboxes/ci_volumes/target/universal/play-java-intro-1.0-SNAPSHOT.tgz .
docker build -t local_release .
docker tag local_release local_release:latest