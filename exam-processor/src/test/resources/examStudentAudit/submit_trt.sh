#!/usr/bin/env bash
#
# Script to post test results.
# Can be used on running ingest
#   - clean and migrate warehouse
#   - run setup_data.sh to load setup files in setup folder.
# Do not run PreloadSetupData.sql as this is used by integration test.
#
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd "$SCRIPT_DIR/trt"

HOST="http://localhost:8080"

COUNT=1000000
for xml in *.xml; do
    if [ ${COUNT} -gt 10000 ]; then
        # fetch bearer token (need jq installed)
        #ACCESS_TOKEN=`curl -s -X POST --data 'grant_type=password&username=dwtest@example.com&password=password&client_id=sbacdw&client_secret=sbacdw123' 'https://sso-deployment.sbtds.org:443/auth/oauth2/access_token?realm=/sbac' | jq -r '.access_token' `
        # if host is using the "stub" token service, use this instead:
        ACCESS_TOKEN="sbac;dwtest@example.com;|SBAC|ASMTDATALOAD|CLIENT|SBAC||||||||||||||"
        echo "reset access token: ${ACCESS_TOKEN}"
        COUNT=0
    fi
    echo "---------------"
    echo "submitting $xml"
    echo "---------------"
    curl -X POST --header "Authorization:Bearer ${ACCESS_TOKEN}" -F file=@"${xml}" ${HOST}/exams/imports
    echo ""
    COUNT=$((COUNT + 1))
done

popd
