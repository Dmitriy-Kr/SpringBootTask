package edu.java.springboottask.exception;

public class NoResourcePresentException extends Exception {

    public NoResourcePresentException(String message) {
        super(message);
    }

    public NoResourcePresentException(String message, Throwable cause) {
        super(message, cause);
    }

    public NoResourcePresentException() {
    }
}

