package com.gdcb.service;

import com.gdcb.repository.FileRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;

@Service
public class FileDeleteServiceImpl implements FileDeleteService{
    @Autowired
    FileRepository fileRepository;
    @Override
    public void delete(String folderName) throws IOException {
        fileRepository.deleteFile(folderName);
    }
}
