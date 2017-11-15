#!/usr/bin/env bash
#
# With a clean db load accommodations, assessments and organizations
curl -X POST --header "Authorization:Bearer sbac;dwtest@example.com;|SBAC|ASMTDATALOAD|CLIENT|SBAC||||||||||||||" -F file=@"./setup/accommodations.xml" http://localhost:8080/accommodations/imports
curl -X POST --header "Authorization:Bearer sbac;dwtest@example.com;|SBAC|ASMTDATALOAD|CLIENT|SBAC||||||||||||||" -F file=@"./setup/assessments.csv" http://localhost:8080/packages/imports
curl -X POST --header "Authorization:Bearer sbac;dwtest@example.com;|SBAC|ASMTDATALOAD|CLIENT|SBAC||||||||||||||" -F file=@"./setup/organizations.json" http://localhost:8080/organizations/imports
