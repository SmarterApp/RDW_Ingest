// Enable XML extensions to simplify processing the XML document
enable 'xml'

// This rule removes leading 10 from item bank key
transform '//Item' by { item ->
    if (item.bankKey.startsWith('10')) {
        item.bankKey = item.bankKey.substring(2)
    }
}

transform '//Response' by { response ->
    def text = response.text

    if (text.contains('choiceInteraction_1') && text.contains('choiceInteraction_2')) {
        // This rule converts EBSR multiple-choice and multiple-select responses to the expected format:
        //    <itemResponse>
        //      <response id="EBSR1">
        //        <value>A</value>
        //      </response>
        //      <response id="EBSR2">
        //        <value>C</value>
        //      </response>
        //    </itemResponse>
        response.text = text
                .replaceAll(~/choiceInteraction_(\d).RESPONSE/, 'EBSR$1')
                .replaceAll(~/choiceInteraction_\d-choice-(\w)/, '$1')

    } else if (text.contains('choiceInteraction_1')) {
        // This rule converts IAT multiple-choice and multiple-select responses to the expected format ("A,C,D")
        def matches = text =~ /choiceInteraction_1-choice-(\w)/
        if (matches.count > 0) {
            response.text = matches.collect { it[1] }.join(',')
        }

    } else if (text.contains('matchInteraction')) {
        // This rule converts Match Interaction (MI) responses to the expected format:
        //    <itemResponse>
        //      <response id="RESPONSE">
        //        <value>1 a</value>
        //        <value>2 b</value>
        //        <value>3 a</value>
        //        <value>4 b</value>
        //      </response>
        //    </itemResponse>
        response.text = text
                .replaceAll(~/matchInteraction_\d.RESPONSE/, 'RESPONSE')
                .replaceAll(~/matchInteraction_\d-(\d)\W*matchInteraction_\d-(\w)/, '$1 $2')

    } else if (text.contains('hotTextInteraction_')) {
        //  This rule converts Hot Text Interaction (HTQ) responses to the expected format:
        //    <itemResponse>
        //      <response id="1">
        //        <value>2</value>
        //        <value>4</value>
        //      </response>
        //    </itemResponse>
        response.text = text
                .replaceAll(~/hotTextInteraction_(\d).RESPONSE/, '$1')
                .replaceAll(~/hotTextInteraction_\d-hottext-(\d)/, '$1')

    } else if ( text.contains('equationInteraction_') ||
                text.contains('tableInteraction_') ||
                text.contains('gridInteraction_') ||
                text.contains('textEntryInteraction_')) {
        // This rule extracts the content out of embedded value tags.
        response.text = text
                .replaceAll(~/(?s).+<value>(.+)<\/value>.+/, '$1')
                .unescapeHtmlTags()
    }
}

outputXml
