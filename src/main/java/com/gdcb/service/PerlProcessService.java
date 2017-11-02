package com.gdcb.service;

import java.io.IOException;

public interface PerlProcessService {
    public int runFigure(String[] para) throws IOException;
    public int runQQPlot(String[] para) throws IOException;
    public String runComparisioninOneFile(String[] para) throws IOException;
    public String runComparisionBetweenTwoFiles(String[] para) throws IOException;

}
