package com.gdcb.client.view.base;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * An interface that designates that its implementer is a view object
 */
public interface ViewObject {
    /**
     * Infers the view type of any object
     * This allows for the identification of strings and integers
     *
     * @param obj
     * @return String
     */
    public static String getViewTypeOf(Object obj) {
        if (obj instanceof ViewObject) {
            return ((ViewObject) obj).getViewType();
        } else if (obj instanceof String) {
            return "string";
        } else if (obj instanceof Integer) {
            return "integer";
        } else {
            return "unspecified";
        }
    }

    /**
     * Returns a string indicating the type of the content that the view object encapsulates
     *
     * @return String
     */
    @JsonIgnore
    public String getViewType();
}