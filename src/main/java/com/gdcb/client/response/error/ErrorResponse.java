package com.gdcb.client.response.error;

import com.gdcb.client.response.base.BaseResponse;

/**
 * @author Chenguang He
 * @email gaoyike@gmail.com
 */
public class ErrorResponse extends BaseResponse {

    protected ErrorCode errorCode;

    public ErrorResponse(ErrorCode errorCode) {
        this.errorCode = errorCode;
        this.message = errorCode.getMessage();
        this.responseType = "error";
    }

    @Override
    public boolean isSuccess() {
        return false;
    }

    public int getErrorCode() {
        return errorCode.getCode();
    }
}
