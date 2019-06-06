enable 'xml'

// Remove leading “10” from bank key if present
transform '//Test' by { test ->
    if (test.bankKey != null && test.bankKey.startsWith('10')) {
        test.bankKey = test.bankKey.substring(2)
    }
}
transform '//Item' by { item ->
    if (item.bankKey != null && item.bankKey.startsWith('10')) {
        item.bankKey = item.bankKey.substring(2)
    }
}

// Fix school ids by left-padding with “0" to make it 14 characters long, if necessary.
transform "//Examinee/ExamineeRelationship[@name='SchoolId']" by {schoolId ->
    schoolId.value = schoolId.value.padLeft(14,'0')
}

// Change score measureLabel from “BenchmarkScore” to “StudentRelativeResidualScore”
transform "//Score[@measureLabel='BenchmarkScore']" by {score ->
    score.measureLabel = 'StudentRelativeResidualScore'
}

outputXml
