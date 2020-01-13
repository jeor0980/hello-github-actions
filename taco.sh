DATA=$(cat <<EOF
'{"title": "Actions: Update express_mono to",
"body": "Please pull these awesome changes in",
"head": "3-actions-test-v4.0.0",
"base": "master"}'
EOF
)

EXPRESS_VERSION="4.0.0"
TESTING_PREFIX="8-actions-test-"
UPSTREAM_NAME=$TESTING_PREFIX$EXPRESS_VERSION


# TARGET="${2}";  # pull request TO this target
BODY="Please pull these awesome changes in";    # this is the content of the message
TITLE="Actions Update express_mono to ${EXPRESS_VERSION}";   # pull request title

DATA="{\"title\":\"${TITLE}\", \"body\":\"${BODY}\", "base":"master", \"head\":\"${UPSTREAM_NAME}\"}";

# DATA='{"title": "Actions Update express_mono to ${EXPRESS_VERSION}", "body": "Please pull these awesome changes in", "head": "10-actions-test-v4.1.2", "base": "master"}'

echo ${TESTING_PREFIX}
echo ${UPSTREAM_NAME}
echo ${DATA}