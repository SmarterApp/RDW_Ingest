## RDW Task Service
The task service is a long-running Spring Boot application that performs repeating tasks:
1. Reconciliation Report - emails CSV with recently processed exam results
1. Update Organizations - pulls district and school information from ART and pushes it to data warehouse

#### Reconciliation Report
This task queries the data warehouse for recently processed exam results, creates a CSV file, and emails it to the
configured recipients. It requires configuration and credentials for a mail host. 

Configuration example:
```yaml
spring:
  mail:
    host: email-smtp.us-west-2.amazonaws.com  
    port: 465
    protocol: smtps
    username: AKIAJQ6JLGIXXSOV64OQ
    password: '{cipher}a41baab69c2aa7fc7b4223f393f01dd0bceed0bc5251dadca1300ac9b0fe628b00690712d43977b4adb192f3dd2f2a0480fefcbf0936794ecaff32d0c1f0aac9'
task:
  send-reconciliation-report:
    cron: 0 0 14 * * *
    query: status=PROCESSED&creator=dwtest@example.com&after=-PT24H
    email:
      subject: Daily Reconciliation Report
      message: Please see attached CSV file for the daily imported exams.
      to: fairway.sbac.rdw.dev@gmail.com, fairway-ops@gmail.com
      from: fairway.sbac.rdw.dev@gmail.com    
```

Developers can configure the system to use a stub mail sender that just logs messages:
```yaml
spring:
  mail:
    host: local
```

#### Update Organizations
This task pulls district and school information from ART and submits it to the data warehouse. It requires ART
credentials for a user that has admin privileges for the configured state, and separate credentials for a user
that has ASMTDATALOAD privileges for the data warehouse import service.

Configuration example:
```yaml
task:
  update-organizations:
    cron: 0 0 4 * * *
    state: CA
    art-client:
      districts-url: https://art-deployment.sbtds.org/rest/district?stateAbbreviation={state}
      groups-of-schools-url: https://art-deployment.sbtds.org/rest/groupofinstitution?stateAbbreviation={state}&pageSize=1000
      schools-url: https://art-deployment.sbtds.org/rest/institution?stateAbbreviation={state}&pageSize=20000
      status-url: https://art-deployment.sbtds.org/rest/status
      oauth2:
        access-token-uri: https://sso-deployment.sbtds.org:443/auth/oauth2/access_token?realm=/sbac
        client-id: sbacdw
        client-secret: '{cipher}cefce1e6d5f37222d6e319684c007ed6c8d98398d4e30b48c7262a3a4e55eb31'
        username: ca.admin@example.com
        password: '{cipher}e0f49b2fdbc5b7107f4161d19a9f5e7566d5487533762410353f1fda01737de5'
    import-service-client:
      organizations-imports-url: http://import-service/organizations/imports
      status-url: http://import-service/status
      oauth2:
        access-token-uri: https://sso-deployment.sbtds.org:443/auth/oauth2/access_token?realm=/sbac
        client-id: sbacdw
        client-secret: '{cipher}93301c70bd9431d535616618ceef6c2f463d8804aee52388dee8572e99712c42'
        username: dwtest@example.com
        password: '{cipher}998e5de7afd18ce6b461e4c3bff1e14884297ecd38f03f038e6a37143594fa50'
```

Developers working with a local version of the import service should configure the import service client:
```yaml
task:
  update-organizations:
    import-service-client:
      organizations-imports-url: http://localhost:8080/organizations/imports
      status-url: http://localhost:8080/status
      stub-auth: sbac;dwtest@example.com;|SBAC|ASMTDATALOAD|CLIENT|SBAC||||||||||||||
```