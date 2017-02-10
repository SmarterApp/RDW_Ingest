package org.rdw.ingest.web;

import org.rdw.ingest.model.RdwImport;
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

    @RequestMapping(value = "/imports",
                    method = RequestMethod.POST)
    public ResponseEntity<RdwImport> postImport(@RequestBody String body,
                                                @RequestParam(required = false) String batchId) {
        return ResponseEntity.ok(service.importExam(body, batchId));
    }

    @RequestMapping(value = "/imports/{id}", method = RequestMethod.GET)
    public ResponseEntity<RdwImport> getImport(@PathVariable String id) {
        return ResponseEntity.ok(service.getImport(id).get());
    }
}
