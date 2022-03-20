Increment() {
    curl -X PUT "https://pixe.la/v1/users/<<parameters.username>>/graphs/<<parameters.graph-id>>/increment" -H "X-USER-TOKEN:<<parameters.token>>" -H 'Content-Length:0'
}

# Will not run if sourced for bats-core tests.
# View src/tests for more information.
ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    Increment
fi
