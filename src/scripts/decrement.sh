token=$(eval "echo \$$PARAM_TOKEN_ENVVAR")
username=$(eval "echo $PARAM_USERNAME")
graphID=$(eval "echo $PARAM_GRAPH_ID")

Decrement() {
    isSuccess=$(curl -s -X PUT -H "X-USER-TOKEN:${token}" -H 'Content-Length:0' \
      "https://pixe.la/v1/users/${username}/graphs/${graphID}/decrement" \
      | jq '.isSuccess')
    if [ "$isSuccess" != "true" ]; then
        return 22
    else
        return 0
    fi
}

# Will not run if sourced for bats-core tests.
# View src/tests for more information.
ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    Decrement
fi
