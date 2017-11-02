package com.gdcb.repository;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;


@Repository
public class FileRepositoryImpl implements FileRepository {

    @Value("${upload_path}")
    private String absolute_path;

    @Override
    public File saveFile(String str, String fileName, String tmpDir) {
        File newDir = new File(absolute_path + tmpDir);
        newDir.mkdir();
        File newFile = new File(absolute_path + tmpDir + "/" + fileName);
        try {
            FileUtils.writeStringToFile(newFile, str, Charset.defaultCharset());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return newFile;
    }

    @Override
    public File saveFile(InputStream inputStream, String fileName, String tmpDir) {
        File newDir = new File(absolute_path + tmpDir);
        newDir.mkdir();
        File newFile = new File(absolute_path + tmpDir + "/" + fileName);
        try {
            FileUtils.copyInputStreamToFile(inputStream, newFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return newFile;
    }

    @Override
    public File moveFile(File file, String tmpDir) {
        File newFile = new File(absolute_path + tmpDir + "/" + file.getName());
        newFile.mkdir();
        try {
            FileUtils.moveFile(file, newFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return newFile;
    }

    @Override
    public File getFile(String fileName, String tmpDir) {
        return new File(absolute_path + tmpDir + "/" + fileName);
    }

    @Override
    public void copyFile(String fileName, String tmpDir1, String tmpDir2) throws IOException {
        File from = new File(absolute_path + tmpDir1 + "/" + fileName);
        File to = new File(absolute_path + tmpDir2 + "/" + fileName);
        FileUtils.copyFile(from, to);
    }

    @Override
    public void deleteFile(String fileName, String tmpDir) {
        FileUtils.deleteQuietly(new File(absolute_path + tmpDir + "/" + fileName));
    }

    @Override
    public void deleteFile(String tmpDir) throws IOException {
        try {
            FileUtils.cleanDirectory(new File(absolute_path + tmpDir));
            FileUtils.deleteDirectory(new File(absolute_path + tmpDir));
        } catch (Exception e) {
        }
    }
}
