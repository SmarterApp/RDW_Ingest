## Change Log

#### 2.4.0 -

Work done as part of RDW Phase 6.

* TechDebt
    * Upgrade gradle, including plugins
    * Upgrade SpringFramework and other libraries (most recent minor revs only, no major upgrades)

#### 2.2.0 -

#### 2.1.0 - 2019-09-18

No real code changes but some "nearby" fixes for this release:

* RP-740: Subject Definition Workbook will not allow less than 3 claims
* RP-754: Latin description levels don't display correctly in the PDF reports
* RP-791: Data Generator - latin results for only grades 5, 8, 11

#### 2.0.0 - 2019-08-27

NOTE: this release was originally 1.4.0 but was re-labelled just before release. So there are artifacts labelled 1.4.0-RC# which are precursors to the 2.0.0-RELEASE.

* Make all services multi-tenant aware
    * This requires significant changes to configuration.
    * Changes certain internal APIs: /status, /migrate
* Add Groovy-based ingest processing pipeline
    * Replaces XSLT-based TRT pre-processing.
* Enhance configurable subjects to support "alt" scores
    * Existing subject definition files must be adjusted:
        * introduce OverallScoring element with min/maxScore attributes
        * add name attribute to ClaimScoring elements
    * Validation
        * assessment cut-points are now validated against their subject min/max scores
        * exam scores are now validated against their assessment min/max scores
            * claim scores, theta scores and student residual scores are no longer validated
* Support Okta for SSO and OAuth2 (in addition to OpenAM).
* Refactor assessment package validation, separating structural/schema validation from business rules.
This may affect DevOps/IT if packages are malformed; they may now use the standalone validation utility.
* Hundreds of minor functionality changes and bug fixes. Most are not listed but here are some:             
    * Reduce the tenancy chain stored in metadata for archived import payloads.
    * Handle multiple tenancy chains in a single string
    * Make sessionId optional by default (change `validation.requiredDataElements`)
    * A number of fixes regarding subjects with itemless, summative assessments only.
    * Make default administration condition based on assessment type (interim=SD, summative=Valid) (RP-276).
    * Allow for "NS"/"0" in overall score to indicate unscored results.
    * Handle null vs. 0 std-err (RP-633) (RDW-105)
    * Don't run migrate olap on service startup
    * Handle edge case when assessment packages are loaded and modified within one migrate cycle (RDW-103)
    * Enforce `limit` param being set in resubmit calls (RDW-97)
    * Properly resolve permissions for district/school level ingest users (RP-567)

#### 1.3.1 - 2019-04-02

* Fix problem with large group file migrate dropping some groups (RP-192).
* Fix migrate/enable end-point to properly enable the job runner (RP-172).

#### 1.3.0 - 2019-02-05

* Add (optional) data order to subject configuration.
* Fix problems with ingest of item-less assessment packages.
* Add (optional) student alias name and (optional) student military connected status.
* Add school-year to accessibility configuration file.
* Add language reference table and enforce primary language code.
* Add optional flag in subject schema to disable target reports for the subject summative assessment.
* Add migrate endpoints for managing migrate tasks (https://github.com/SmarterApp/RDW/blob/develop/docs/API.md#task-endpoints).
* Upgrade Spring framework and other dependencies.

#### 1.2.3 - 2018-09-13

* Upgrade XSLT to 2.0

#### 1.2.2 - 2018-09-11

* Add configurable TRT transformations.

#### 1.2.1 - 2018-07-06

* Configurable Subjects migrate and bug fixing

#### 1.2.0 - 2018-06-23

* Extend Custom Aggregate Reports to include IABs
* Longitudinal Reports
* Target Reports.
* Student Groups API end-point.
* Configurable Subjects (ingest only, 1.2.x will expand).
* Configurable required/optional fields.

#### 1.1.0 - 2018-02-27

* Custom Aggregate Reporting.
    * Add aggregate (aka olap) reporting data store.
    * New migrate service for olap.
* Process norms (aka percentiles).
* Add state and district embargo flags for aggregate and individual test results.
    * Includes auditing of any changes to the embargo flags.
* Process enhanced tabulator output.
    * NOTE: this requires reloading assessment packages to update item details.
* Add auditing of student PII data.
* Add inferred school for students.
* Change datasource URL configuration.
    * NOTE: this requires updating configuration files for all services.
* Fix CSV loading to tolerate various line delimiters, empty rows, comments, etc.
    * NOTE: remove config hack for sql.load-csv.
* Change default server (embedded tomcat) settings for performance.
* Handle groups of districts and schools (from ART).
* Detect and handle exam update/delete.      
    
#### 1.0.2 - 2017-12-05

* Make student group upload processing more tolerant of various line endings.
    * NOTE: remove override of `sql.load-csv`

#### 1.0.1 - 2017-09-12

* Fix reconciliation report to properly reset query time range.

#### 1.0.0 - 2017-09-04

* Initial release.

