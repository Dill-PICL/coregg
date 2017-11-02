package com.gdcb.repository;

import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

@Repository
public class SessionParameters implements SessionParametersRepository{
    Map<Integer, String[]> map = new HashMap<>();
    @Override
    public String[] getParameters(int sessionId) {
        return map.getOrDefault(sessionId,new String[3]);
    }

    @Override
    public void setParameters(int sessionId, String[] para) {
        if (para.length != 3)
            throw new IllegalStateException("Parameter's length must be 3!");
        map.putIfAbsent(sessionId,para);
    }
}
