package com.gdcb.client.view.base;

/**
 * @author Chenguang He
 * @email gaoyike@gmail.com
 */
public class ModelView<T> implements ViewObject {
    private T item;

    public ModelView(T item) {
        this.item = item;
    }

    @Override
    public String getViewType() {
        return item.getClass().getSimpleName() + "-view";
    }

    public T getItem() {
        return item;
    }
}
