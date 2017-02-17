package org.rdw.ingest.processor.model;

import javax.validation.constraints.Null;
import java.util.Date;

public class Student extends IdentifiableWithNaturalId<Long> {
    private String lastOrSurname;
    private String firstName;
    private String middleName;
    private int gender;
    private int ethnicity;

    @Null
    private Date firsEntryIntoUSSchoolAt;
    @Null
    private Date lepEntryAt;
    @Null
    private Date lepExitAt;
    private Date birthday;

    public String getSsid() {
        return getNaturalId();
    }

}
