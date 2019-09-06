#!/bin/sh
# Script to use in local development. Copies user scripts out to local archive dir.
# NOTE: may need updating to handle multi-tenants!!!
mkdir -p /tmp/pipelines/exam
cp user.*.groovy /tmp/pipelines/exam
cp user.*.groovy.properties /tmp/pipelines/exam
