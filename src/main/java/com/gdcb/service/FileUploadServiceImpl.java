package com.gdcb.service;

import com.gdcb.repository.FileRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Random;

@Service
public class FileUploadServiceImpl implements FileUploadService{
    @Autowired
    FileRepository fileRepository;
    @Override
    public String saveFile(List<InputStream> uploadedFile, String fileName, int session) {
        String tmpFolder = String.valueOf(session);
        for (InputStream inputStream: uploadedFile) {
            fileRepository.saveFile(inputStream,fileName,tmpFolder);
        }
        return tmpFolder;
    }

    @Override
    public String moveFile(String fileName, int session, int session2) throws IOException {
        String tmpFolder1 = String.valueOf(session);
        String tmpFolder2 = String.valueOf(session2);
        fileRepository.copyFile(fileName,tmpFolder1,tmpFolder2);
        return tmpFolder1+"|"+tmpFolder2;
    }

    @Override
    public String saveFile(String s, String fileName, int session) {
        String tmpFolder = String.valueOf(session);
        fileRepository.saveFile(s,fileName,tmpFolder);
        return tmpFolder;
    }
}
