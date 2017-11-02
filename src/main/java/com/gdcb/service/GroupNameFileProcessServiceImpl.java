package com.gdcb.service;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Service
public class GroupNameFileProcessServiceImpl implements GroupNameFileProcessService {
    @Value("${upload_path}")
    protected String absolute_path;

    @Override
    public Map<String, String> process(int session) {
        File file = new File(absolute_path + session + "/" + "group_name_file");
        try {
            String s = FileUtils.readFileToString(file,"utf-8");
            Map<String, String> res = new HashMap<>();
            String[] strs = s.split("\n");
            for (String str : strs){
                res.putIfAbsent(str,str.replaceAll(" ","_"));
            }
            return res;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
