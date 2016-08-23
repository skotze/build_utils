#!/bin/bash
set -x
if [ -z "$GIT_URL" ]; then
	echo "please provide the GIT_URL environmental variable to the container" 
	exit 1
fi
if [ -z "$GIT_REPO" ]; then
	echo "please provide the GIT_REPO environmental variable to the container" 
	exit 1
fi
echo "contaner env:"
env
mkdir build_dir
cd /build_dir
git clone --depth=1 --progress $GIT_URL$GIT_REPO.git 
cd $GIT_REPO
sbt $1 $2
echo "remove any stale artefacts from previous runs of the container that were not cleaned up by running docker rm (removing $TARGET_DIRECTORY/*)"
rm -rf $TARGET_DIRECTORY/*
echo "(re/create) target directory: $TARGET_DIRECTORY"
mkdir -p $TARGET_DIRECTORY
echo "copying artefacts to target directory: $TARGET_DIRECTORY"
cp -r target/* $TARGET_DIRECTORY