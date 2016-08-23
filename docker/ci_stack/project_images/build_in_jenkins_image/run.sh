docker run -i --rm --volumes-from ci_stack_volume --env GIT_URL="https://github.com/skotze/" --env GIT_REPO="testrepo" --name build_in_jenkins build_in_jenkins 

