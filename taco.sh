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

echo ${TESTING_PREFIX}
echo ${UPSTREAM_NAME}