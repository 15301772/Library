package com.exception;

public class ParamErrorException extends Exception {
    String message;

    @Override
    public String getMessage() { return message; }

    public void setMessage(String message) { this.message = message; }

    public ParamErrorException() { }
}
