package com.gdcb.repository;

import java.lang.reflect.Parameter;

public interface SessionParametersRepository {
    String[] getParameters(int sessionId);
    void setParameters(int sessionId, String[] para);
}
