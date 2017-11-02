package com.gdcb.client.response.base;


import com.gdcb.client.view.base.ViewObject;

/**
 * @author Chenguang He
 * @email gaoyike@gmail.com
 */
public class ViewObjectResponse<ViewType extends ViewObject> extends BaseResponse {
    private ViewType result;

    public ViewObjectResponse(ViewType result) {
        this(result, "");
    }

    public ViewObjectResponse(ViewType result, String message) {
        this.result = result;
        if (result != null) {
            success = true;
            responseType = result.getViewType();
        }
        this.message = message;
    }

    public ViewType getResult() {
        return result;
    }
}
