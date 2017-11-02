package com.gdcb.client.response.base;


import com.gdcb.client.view.base.ListView;
import com.gdcb.client.view.base.ViewObject;

import java.util.List;

/**
 * @author Chenguang He
 * @email gaoyike@gmail.com
 */
public class ListViewResponse<ViewType> extends BaseResponse {
    protected ListView<ViewType> result;
    protected boolean success;
    protected String responseType;

    protected ListViewResponse(ListView<ViewType> result) {
        this.result = result;
        if (result != null) {
            success = true;
            super.success = true;
            this.responseType = result.getViewType();
        }
    }

    protected ListViewResponse(ListView<ViewType> result, String message) {
        this.result = result;
        if (result != null) {
            success = true;
            super.success = true;
            this.responseType = result.getViewType();
            super.message = message;
        }
    }

    public static <ViewType extends ViewObject> ListViewResponse<ViewType> of(List<ViewType> items) {
        return new ListViewResponse<>(ListView.of(items));
    }

    public static <ViewType extends ViewObject> ListViewResponse<ViewType> of(List<ViewType> items, String message) {
        return new ListViewResponse<>(ListView.of(items),message);
    }


    public static ListViewResponse<String> ofStringList(List<String> items) {
        return new ListViewResponse<>(ListView.ofStringList(items));
    }

    public static ListViewResponse<Integer> ofIntList(List<Integer> items) {
        return new ListViewResponse<>(ListView.ofIntList(items));
    }

    public ListView<ViewType> getResult() {
        return result;
    }
}
