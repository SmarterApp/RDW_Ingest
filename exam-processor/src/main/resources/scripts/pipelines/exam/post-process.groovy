//
// System validation script for ingested TRTs.
//
logger.debug('Running system validation for Exam Processor')

// Convert input to report object
def report = xmlUtils.tdsReportFromXml(new ByteArrayInputStream(input as byte []))
if (report.examinee == null) errorImmediately("Examinee may not be null")

// Validate school ID exists and matches record in school repo
Integer schoolId = parseSchoolId(report.examinee)
logger.debug("Retrieved school ID: ${schoolId}")

// Validate that test matches a stored assessment
// (TRT has an assessment name and id flipped, so this is intentional)
String assessmentNaturalId = report.test.name
def assessment =  assessmentRepository.findOneByNaturalId(assessmentNaturalId)
if (assessment == null)
    errorImmediately('UNKNOWN_ASMT', "Unable to find an assessment by natural id [${assessmentNaturalId}]")

logger.debug("Found assessment for natural ID: ${assessmentNaturalId}")

//
// Validate the TRT's test against the stored assessment
//
if (!assessment.subjectCode.equalsIgnoreCase(report.test.subject))
    addError "Assessment natural id [${assessment.naturalId}], Test subject",
            report.test.subject,
            "exam subject does not match asmt subject: ${assessment.subjectCode}"

def formattedGrade = parserHelper.validate("grade", report.test.grade, parserHelper.toGrade)
if (!assessment.gradeCode.equalsIgnoreCase(formattedGrade))
    addError "Assessment natural id [${assessment.naturalId}], Test grade",
            formattedGrade,
            "exam grade does not match asmt grade: ${assessment.gradeCode}"

//
// Use existing processing services for additional validation
//
def exam = studentExamProcessor.parseExam(report, schoolId, assessment)
examineeProcessor.parseStudent(report.examinee, exam.schoolYear, schoolId)

// Check if any errors have been added to the error collector. If so throw a combined error.
// Otherwise returns true (valid). (This should be the last line of any system validation script.)

checkValid


//
// Validates that the examinee's school exists in the data store, and return its ID.
//
int parseSchoolId(def examinee) {
    trtUtils.with {
        String naturalId = getBestRelationshipValue(examinee, "SchoolId")
        Integer schoolId = schoolRepository.findIdByNaturalId(naturalId)

        if (schoolId != null) return schoolId

        // put as much info as possible into the import message
        final String schoolName = getBestRelationshipValue(examinee, "SchoolName")
        final String districtId = getBestRelationshipValue(examinee, "DistrictId")
        final String districtName = getBestRelationshipValue(examinee, "DistrictName")

        errorImmediately 'UNKNOWN_SCHOOL',
                "unable to find a school with natural id [${naturalId}]. School name: ${schoolName}, " +
                        "district id: [${districtId}], district name: ${districtName}"
    }
}
