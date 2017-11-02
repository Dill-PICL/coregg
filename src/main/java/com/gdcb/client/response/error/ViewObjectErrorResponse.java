package com.gdcb.client.response.error;


import com.gdcb.client.view.base.ViewObject;

/**
 * @author Chenguang He
 * @email gaoyike@gmail.com
 */
public class ViewObjectErrorResponse extends ErrorResponse {

    protected Object errorData;

    public ViewObjectErrorResponse(ErrorCode errorCode, ViewObject errorData) {
        super(errorCode);
        this.errorData = errorData;
    }

    public ViewObjectErrorResponse(ErrorCode errorCode, String errorData) {
        super(errorCode);
        this.errorData = errorData;
    }

    public ViewObjectErrorResponse(ErrorCode errorCode, Integer errorData) {
        super(errorCode);
        this.errorData = errorData;
    }

    public Object getErrorData() {
        return errorData;
    }

    public String getErrorDataType() {
        return ViewObject.getViewTypeOf(errorData);
    }
}
