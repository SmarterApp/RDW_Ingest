package org.rdw.ingest.processor.model;

public class StudentAttributes extends Identifiable<Long> {

    private Long studentId;
    private Integer responsibleSchoolId;
    private Integer gradeId;

    private Boolean iep;
    private Boolean lep;
    private Boolean section504;
    private Boolean economicDisadvantage;
    private Boolean migrantStatus;
    private String engProfLvl;
    private String t3ProgramType;
    private String languageCode;
    private String primDisabilityType;
}
