token=$(eval "echo \$$PARAM_TOKEN_ENVVAR")
username=$(eval "echo $PARAM_USERNAME")
graphID=$(eval "echo $PARAM_GRAPH_ID")

Put() {
    jsonData=$(jq -n \
        --arg a1 "${PIXELA_QUANTITY}" \
        --arg a2 "${PIXELA_OPTIONAL_DATA}" \
        '{quantity: $a1, optionalData: $a2}')

    isSuccess=$(curl -s -X PUT -H "X-USER-TOKEN:${token}" -d "${jsonData}" \
        "https://pixe.la/v1/users/${username}/graphs/${graphID}/${PIXELA_DATE}" \
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
    Put
fi
