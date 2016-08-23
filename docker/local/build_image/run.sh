docker run -i --rm -v /home/osboxes/ci_volumes/my_ivy_cache:/ivy_cache -v /home/osboxes/ci_volumes/target:/target --env GIT_URL="https://github.com/skotze/" --env GIT_REPO="testrepo" --name local_build local_build 

