package org.rdw.ingest.web;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import java.util.NoSuchElementException;

/**
 * Dumb name, this is just the global REST exception handling we need.
 */
@ControllerAdvice
class IngestExceptionHandler extends ResponseEntityExceptionHandler {

    /**
     * This catches Optional.get() when it is empty.
     *
     * @param ex original exception
     * @param request request
     * @return NOT_FOUND (404) response
     */
    @ExceptionHandler(value = NoSuchElementException.class)
    protected ResponseEntity<Object> handleNoSuchElement(RuntimeException ex, WebRequest request) {
        return handleExceptionInternal(ex, "no such element", new HttpHeaders(), HttpStatus.NOT_FOUND, request);
    }

    /**
     * This catches result from unimplemented methods. Should go away at some point.
     *
     * @param ex original exception
     * @param request request
     * @return 4xx response
     */
    @ExceptionHandler(value = UnsupportedOperationException.class)
    protected ResponseEntity<Object> handleUnsupportOperation(RuntimeException ex, WebRequest request) {
        return handleExceptionInternal(ex, "unsupported operation", new HttpHeaders(), HttpStatus.I_AM_A_TEAPOT, request);
    }
}
