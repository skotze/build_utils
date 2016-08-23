cp ~/target/universal/play-java-intro-1.0-SNAPSHOT.tgz .
docker build -t releaseimage .
docker tag releaseimage releaseimage:latest