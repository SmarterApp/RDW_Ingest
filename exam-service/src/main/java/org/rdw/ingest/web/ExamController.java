package org.rdw.ingest.web;

import org.rdw.ingest.service.ExamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import rdw.model.TDSReport;

import javax.validation.constraints.NotNull;

import static com.google.common.base.Preconditions.checkNotNull;

/**
 * Controller for exam / testresults end-points
 */
@RestController
@RequestMapping({ "/exams", "/testresults" })
class ExamController {

    private final ExamService service;

    @Autowired
    public ExamController(@NotNull final ExamService service) {
        this.service = checkNotNull(service);
    }

    @RequestMapping(method = RequestMethod.POST,
                    consumes = MediaType.APPLICATION_XML_VALUE,
                    produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE })
    public ResponseEntity<TDSReport> postExam(@RequestBody String body,
                                              @RequestParam(required = false) String batchId) {
        return ResponseEntity.ok(service.submitExam(body, batchId).get());
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<TDSReport> getExam(@PathVariable String id) {
        return ResponseEntity.ok(service.getExam(id).get());
    }
}
