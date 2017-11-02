package com.gdcb.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public interface FileUploadService {
    String saveFile(List<InputStream> uploadedFile, String fileName, int session);
    String moveFile(String fileName, int session, int session2) throws IOException;
    String saveFile(String s, String fileName, int session);
}