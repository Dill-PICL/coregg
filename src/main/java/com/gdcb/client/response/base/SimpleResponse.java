package com.gdcb.client.response.base;

/**
 * @author Chenguang He
 * @email gaoyike@gmail.com
 */
public class SimpleResponse extends BaseResponse {
    public SimpleResponse(boolean success, String message, String type) {
        this.success = success;
        this.message = message;
        this.responseType = type;
    }
}
