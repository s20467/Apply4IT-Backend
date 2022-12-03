package pjatk.Apply4IT.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.context.request.WebRequest;

@ControllerAdvice
public class ControllerExceptionHandler {

    @ExceptionHandler(ResourceNotFoundException.class)
    @ResponseStatus(value = HttpStatus.NOT_FOUND, reason = "Resource not found")
    public void handleResourceNotFoundException(ResourceNotFoundException exc, WebRequest webRequest) {
    }

    @ExceptionHandler(ResourceConflictException.class)
    @ResponseStatus(value = HttpStatus.CONFLICT, reason = "Resource conflict")
    public void handleResourceConflictException(ResourceConflictException exc, WebRequest webRequest) {
    }
}
