// Enable XML extensions to simplify processing the XML document
enable 'csv'

transformRows { row ->
    // Delete rows with AssessmentId containing 'DELETE_ME';
    if (row.AssessmentId.contains('DELETE_ME')) {
        row.delete()
    }

    // Take out extraneous 'very very very ...' and replace with single 'very'
    row.AssessmentName = (row.AssessmentName =~ /(very\s*)+very/).replaceFirst('very')

    // Change all AssessmentTypes to summative
    row.AssessmentType = 'summative'
}

outputCsv
