package org.rdw.ingest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import rdw.model.TDSReport;

import java.util.Optional;

import static org.hamcrest.Matchers.containsString;
import static org.mockito.BDDMockito.given;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(SpringRunner.class)
@WebMvcTest(ExamController.class)
public class ExamControllerTests {

    @Autowired
    private MockMvc mvc;

    @MockBean
    private ExamService examService;

    @Test
    public void itShouldUseServiceToSubmitExam() throws Exception {
        final String body = "<TDSReport/>";
        given(examService.submitExam(body, null)).willReturn(Optional.of(testReport(null)));
        mvc.perform(post("/exams").contentType(MediaType.APPLICATION_XML).content(body))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("123")));
    }

    @Test
    public void itShouldReturn4xxForUnsupportedOperation() throws Exception {
        final String body = "<TDSReport/>";
        given(examService.submitExam(body, null)).willThrow(UnsupportedOperationException.class);
        mvc.perform(post("/exams").contentType(MediaType.APPLICATION_XML).content(body))
                .andExpect(status().is4xxClientError());
    }

    @Test
    public void itShouldUseServiceToGetExam() throws Exception {
        final String id = "abc";
        given(examService.getExam(id)).willReturn(Optional.of(testReport("abc")));
        mvc.perform(get("/exams/" + id))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("abc")));
    }

    @Test
    public void itShouldReturn404ForUnknownExam() throws Exception {
        final String id = "abc";
        given(examService.getExam(id)).willReturn(Optional.empty());
        mvc.perform(get("/exams/" + id))
                .andExpect(status().isNotFound());
    }

    private TDSReport testReport(final String id) {
        final TDSReport report = new TDSReport();
        final rdw.model.Test test = new rdw.model.Test();
        test.setTestId(id == null ? "123" : id);
        report.setTest(test);
        return report;
    }
}
