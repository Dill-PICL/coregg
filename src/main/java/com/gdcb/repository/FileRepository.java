package com.gdcb.repository;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

public interface FileRepository {
    public File saveFile(String str, String fileName,String tmpDir);
    public File saveFile(InputStream inputStream, String fileName, String tmpDir);
    public File moveFile(File file, String tmpDir);
    public File getFile(String fileName, String tmpDir);
    public void copyFile(String fileName, String tmpDir1,  String tmpDir2) throws IOException;
    public void deleteFile(String fileName, String tmpDir);
    public void deleteFile(String tmpDir) throws IOException;

}
