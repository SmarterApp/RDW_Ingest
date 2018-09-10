## Change Log

#### 1.3.0


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

