token=$(eval "echo \$$PARAM_TOKEN_ENVVAR")
username=$(eval "echo $PARAM_USERNAME")
graphID=$(eval "echo $PARAM_GRAPH_ID")

isSuccess=$(curl -s -X PUT -H "X-USER-TOKEN:${token}" -H 'Content-Length:0' \
    "https://pixe.la/v1/users/${username}/graphs/${graphID}/increment" \
    | jq '.isSuccess')
if [ "$isSuccess" != "true" ]; then
    return 22
fi
