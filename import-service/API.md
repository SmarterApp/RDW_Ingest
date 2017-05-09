## Import Service

### Authentication and Authorization
The import service requires OAuth2 access tokens for all end-points. For most end-points this must be a password
grant token requested by a trusted client for a user of the system (the permissions are associated with the user). 
Some end-points require only a client-credentials grant (without user credentials). Tokens are fetched from the 
OpenAM server.

#### Create Password Grant Token
Accepts x-www-form-urlencoded data including client and user credentials and returns an access token.
* URL: `/auth/oauth2/access_token`
* Method: `POST`
* URL Params: 
  * `realm=/sbac`
* Data Params (except for `grant_type` values given are examples and should be replaced with real values):
  * `grant_type=password`
  * `username=user@example.com`
  * `password=UserPassword`
  * `client_id=client`
  * `client_secret=ClientSecret`
* Success Response:
  * Code: 200 (OK)
  * Content: 
```json
{
  "scope": "cn givenName mail sbacTenancyChain sbacUUID sn",
  "expires_in": 36000,
  "token_type": "Bearer",
  "refresh_token": "639ddaa9-f993-4c52-aec5-923d5a21ee23",
  "access_token": "464e5ea8-3572-4145-bdc8-64a4a581a38e"
} 
```
* Error Response:
  * Code: 400 (Bad Request)
  * Content (specific error and description will vary):
```json
{
  "error": "invalid_client",
  "error_description": "Client authentication failed"
}
```
* Sample Call (curl):
```bash
curl -s -X POST \
  --data "grant_type=password&username=user@example.com&password=password&client_id=client&client_secret=secret" \
  https://openam/auth/oauth2/access_token?realm=/sbac
```

#### Create Client Credentials Token
Accepts x-www-form-urlencoded data including client credentials and returns an access token.
* URL: `/auth/oauth2/access_token`
* Method: `POST`
* URL Params: 
  * `realm=/sbac`
* Data Params (except for `grant_type` values given are examples and should be replaced with real values):
  * `grant_type=client_credentials`
  * `client_id=client`
  * `client_secret=ClientSecret`
* Success Response:
  * Code: 200 (OK)
  * Content: 
```json
{
  "scope": "cn givenName mail sbacTenancyChain sbacUUID sn",
  "expires_in": 36000,
  "token_type": "Bearer",
  "access_token": "854dbb6e-7df2-40d2-86b5-a78ac1cb4ad2"
} 
```
* Error Response:
  * Code: 400 (Bad Request)
  * Content (specific error and description will vary):
```json
{
  "error": "invalid_client",
  "error_description": "Client authentication failed"
}
```
* Sample Call (curl):
```bash
curl -s -X POST \
  --data "grant_type=client_credentials&client_id=client&client_secret=secret" \
  https://openam/auth/oauth2/access_token?realm=/sbac
```

### Exam Endpoints
End-points for dealing with exams aka test results.
As mentioned above, all end-points require a valid token, the examples use `{access_token}` as a placeholder.

#### Create Exam Import Request
Accepts payloads in Test Result Transmission ([TRT](http://www.smarterapp.org/documents/TestResultsTransmissionFormat.pdf)) 
format, creating new exam import requests. The import requests are processed and published to the reporting data mart.
Import payloads are hashed and duplicate content is detected, returning any previous import request for the given
content. Thus submitting a payload a second time will no-op and return the current status of the previous import.

* URL: `/exams/imports`
* Method: `POST`
* Params: none
* Headers:
  * `Content-Type:application/xml`
  * `Authorization: Bearer {access_token}`
* Body: TRT
* Success Response:
  * Code: 202 (Accepted)
  * Content:
```json
{
  "id": 19529,
  "content": "EXAM",
  "contentType": "application/xml",
  "digest": "5899C64887FE25BC1F015FD7C26476E4",
  "status": "ACCEPTED",
  "creator": "user@example.com",
  "created": "2017-05-08T19:45:20.476Z",
  "_links": {
    "self": {
      "href": "http://localhost:8080/exams/imports/19529"
    }
  }
}
```
* Error Response:
  * Code: 401 (Unauthorized)
* Sample Call (curl):
```bash
curl -X POST --header "Authorization:Bearer {access_token}" --header "Content-Type:application/xml" \
  --data-binary "<TDSReport><Test..." https://import-service/exams/imports
```
  
#### Get Import Request
This end-point may be used to get the current status of an import request.

* URL: `/exams/imports/{id}`
* Method: `GET`
* Params: none
* Headers:
  * `Authorization: Bearer {access_token}`
* Success Response:
  * Code: 200 (OK)
  * Content:
```json
{
  "id": 19529,
  "content": "EXAM",
  "contentType": "application/xml",
  "digest": "5899C64887FE25BC1F015FD7C26476E4",
  "status": "BAD_DATA",
  "creator": "user@example.com",
  "created": "2017-05-08T19:45:20.476Z",
  "message": "{\"elementName\":\"Sex\",\"value\":\"M\",\"error\":\"unknown gender name [M]\"},{\"elementName\":\"GradeLevelWhenAssessed\",\"value\":\"SIXTHGRADE\",\"error\":\"unknown grade code [SIXTHGRADE]\"}",
  "_links": {
    "self": {
      "href": "http://localhost:8080/exams/imports/19529"
    }
  }
}
```
* Error Response:
  * Code: 401 (Unauthorized)
* Sample Call (curl):
```bash
curl --header "Authorization:Bearer {access_token}" https://import-service/exams/imports/19529
```

#### Get Import Reconciliation Report
This report summarizes exams that have been recently imported, collated into CSV format. The defaults will present
all exam import requests submitted in the last 24 hours that have made it to the PROCESSED state. If custom behavior
is desired, parameters may be set; note that, if any parameter is set, all the defaults are cleared. So, for example,
if `after=-PT10H&before=-PT1H` is desired (to reduce time window), the status must be set `status=PROCESSED` as well.

* URL: `/exams/imports/reconciliation`
* Method: `GET`
* Params (see comment above):
  * `batch=MyBatchLabel`
  * `status=PROCESSED`
  * `creator=user@example.com`
  * `before=-PT1H`
  * `after=-PT24H`
* Headers:
  * `Accept:text/csv`
  * `Authorization: Bearer {access_token}`
* Success Response:
  * Code: 200 (OK)
  * Content:
```text
student_id,asmt_guid,date_taken
ASIXTHGRADER20,(SBAC)SBAC-IAB-FIXED-G6M-EE-Winter-2016-2017,20161012
...
```
* Error Response:
  * Code: 401 (Unauthorized)
* Sample Call (curl):
```bash
curl --header "Authorization:Bearer {access_token}" 
  https://import-service/exams/imports/reconciliation?status=PROCESSED&after=-PT10H
```

### TODO
* Investigate using [Spring REST Docs](http://projects.spring.io/spring-restdocs/).