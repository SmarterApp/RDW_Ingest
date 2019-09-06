#!/bin/sh
# Script to use in local development. Copies user scripts out to local archive dir.
# NOTE: may need updating to handle multi-tenants!!!
mkdir -p /tmp/pipelines/assessment
cp user.*.groovy /tmp/pipelines/assessment
cp user.*.groovy.properties /tmp/pipelines/assessment
