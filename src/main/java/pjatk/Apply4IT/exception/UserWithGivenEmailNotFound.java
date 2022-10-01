package pjatk.Apply4IT.exception;

public class UserWithGivenEmailNotFound extends RuntimeException {

    public UserWithGivenEmailNotFound(String message) {
        super(message);
    }

    public UserWithGivenEmailNotFound(String message, Throwable cause) {
        super(message, cause);
    }

    public UserWithGivenEmailNotFound(Throwable cause) {
        super(cause);
    }

    public UserWithGivenEmailNotFound(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
