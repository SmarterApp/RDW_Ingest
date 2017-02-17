package org.rdw.ingest.processor.model;

import java.util.Date;
import java.util.List;


public class AnyExam {
    //TODO: consider adding it?
    private Date dateCompleted;
    private long assessmentId;
    private String asmtVersion;
    private int opportunity;
    private int completeness;
    private int administrationConditionId;
    private boolean isValid;
    private String status;
    private String sessionId;
    private StudentAttributes studentAttributes;
    private List<Accommodation> availableAccommodations;

}
