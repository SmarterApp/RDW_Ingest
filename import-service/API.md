## Import Service

### Authentication and Authorization
The import service requires OAuth2 access tokens for all end-points. For most end-points this must be a password
grant token requested by a trusted client for a user of the system (the permissions are associated with the user). 
Some end-points require only a client-credentials grant (without user credentials). Tokens are fetched from the 
OpenAM server.

#### Create Password Grant Token
Accepts x-www-form-urlencoded data including client and user credentials and returns an access token.
* Host: OpenAM
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
* Host: OpenAM
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

This end-point requires credentials with the `ASMTDATALOAD` role.

There are two ways of posting exam content: with a raw body of type `application/xml` or form-data (file upload).

* URL: `/exams/imports`
* Method: `POST`
* URL Params: any URL param will be preserved as properties for the upload, well-known params:
  * `batch=<batchtag>`
  * `filename=<originalFileName>`  (not needed for form-data)
* Headers:
  * `Authorization: Bearer {access_token}`
* Headers (raw body):
  * `Content-Type:application/xml`
* Body (raw body): TRT
* Headers (form-data):
  * `Content-Type:multipart/form-data`
* Form data (form-data):
  * `file` - the upload file
  * `filename=<filename>`
  * any other form data will be preserved as properties for the upload
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
  * Code: 401 (Unauthorized) if token is missing or invalid.
  * Code: 403 (Forbidden) if token doesn't provide the `ASTMDATALOAD` role.
* Sample Call (raw body):
```bash
curl -X POST --header "Authorization:Bearer {access_token}" --header "Content-Type:application/xml" \
  --data-binary "<TDSReport><Test..." https://import-service/exams/imports?batch=WinterICA&filename=winterICA.1.xml
```
* Sample Call (form-data):
```bash
curl -X POST --header "Authorization:Bearer {access_token}" -F file=@winterICA.1.xml -F batch=WinterICA \
  https://import-service/exams/imports
```
  
#### Get Import Request
This end-point may be used to get the current status of an import request.

This end-point requires credentials with the `ASMTDATALOAD` role.

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
    },
    "payload": {
      "href": "http://localhost:8080/exams/imports/19529/payload"
    },
    "payload-properties": {
      "href": "http://localhost:8080/exams/imports/19529/payload/properties"
    }  
  }
}
```
* Error Response:
  * Code: 401 (Unauthorized) if token is missing or invalid.
  * Code: 403 (Forbidden) if token doesn't provide the `ASTMDATALOAD` role.
  * Code: 404 (Not Found) if no import with the given id exists.
* Sample Call (curl):
```bash
curl --header "Authorization:Bearer {access_token}" https://import-service/exams/imports/19529
```

#### Get Import Payload
This end-point may be used to get the payload for an import request. 

This end-point requires credentials with the `ASMTDATALOAD` role.

* URL: `/exams/imports/{id}/payload`
* Method: `GET`
* Params: none
* Headers:
  * `Authorization: Bearer {access_token}`
* Success Response:
  * Code: 200 (OK)
  * Content: File attachment
* Error Response:
  * Code: 401 (Unauthorized) if token is missing or invalid.
  * Code: 403 (Forbidden) if token doesn't provide the `ASTMDATALOAD` role.
  * Code: 404 (Not Found) if no import with the given id exists.
* Sample Call (curl):
```bash
curl --header "Authorization:Bearer {access_token}" https://import-service/exams/imports/19529/payload
```

#### Get Import Payload Properties
This end-point may be used to get the payload properties for an import request. This can be useful because not all
the properties for an import are stored in the data warehouse, some are archived only with the payload.

This end-point requires credentials with the `ASMTDATALOAD` role.

* URL: `/exams/imports/{id}/payload/properties`
* Method: `GET`
* Params: none
* Headers:
  * `Authorization: Bearer {access_token}`
* Success Response:
  * Code: 200 (OK)
  * Content: 
```json
{
  "content-type": "application/xml",
  "filename": "test.xml",
  "batch": "CAF4901EA92C0A77A6DB6C37E8582852",
  "tenancy-chain": "|SBAC|ASMTDATALOAD|CLIENT|SBAC||||||||||||||",
  "username": "user@example.com"
}
```
* Error Response:
  * Code: 401 (Unauthorized) if token is missing or invalid.
  * Code: 403 (Forbidden) if token doesn't provide the `ASTMDATALOAD` role.
  * Code: 404 (Not Found) if no import with the given id exists.
* Sample Call (curl):
```bash
curl --header "Authorization:Bearer {access_token}" https://import-service/exams/imports/19529/payload/properties
```

### Status Endpoints
End-points for querying the status of the system. These are intended primarily for operations but can be useful when
initially connecting to the system.

#### Get Diagnostic Status
This end-point may be used to get the status of the import service.

This end-point requires credentials (a client-credentials grant is sufficient).

* URL: `/status`
* Method: `GET`
* URL Params:
  * `level=#` where # can be 0-5; optional, default is `level=0`
* Headers:
  * `Authorization: Bearer {access_token}`
* Success Response:
  * Code: 200 (OK)
  * Content: varies based on level; for `level=0`:
```json
{
  "statusText": "Ideal",
  "statusRating": 4,
  "level": 0,
  "dateTime": "2017-05-11T23:26:51.523+0000"
}
```
* Error Response:
  * Code: 401 (Unauthorized) if token is missing or invalid.
* Sample Call (curl):
```bash
curl --header "Authorization:Bearer {access_token}" https://import-service/status?level=2
```

### TODO
* Investigate using [Spring REST Docs](http://projects.spring.io/spring-restdocs/).