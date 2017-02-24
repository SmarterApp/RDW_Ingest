package org.rdw.ingest.processor.service;

import org.rdw.ingest.processor.model.StudentExamAttributes;
import rdw.model.TDSReport.Examinee;

public interface ExamineeProcessor {
    StudentExamAttributes process(Examinee examinee);
}
