PARAM_TOKEN=$(eval "echo ${PARAM_TOKEN}")
PARAM_USERNAME=$(eval "echo ${PARAM_USERNAME}")
PARAM_GRAPH_ID=$(eval "echo ${PARAM_GRAPH_ID}")

Increment() {
    curl -X PUT -H "X-USER-TOKEN:${PARAM_TOKEN}" -H 'Content-Length:0' \
      "https://pixe.la/v1/users/${PARAM_USERNAME}/graphs/${PARAM_GRAPH_ID}/increment"
}

# Will not run if sourced for bats-core tests.
# View src/tests for more information.
ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    Increment
fi
