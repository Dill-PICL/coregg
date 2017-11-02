package com.gdcb.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdcb.repository.SessionParametersRepository;
import com.gdcb.service.FileDeleteService;
import com.gdcb.service.FileUploadService;
import com.gdcb.service.GroupNameFileProcessService;
import com.gdcb.service.PerlProcessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class ProcessingController {

    @Autowired
    FileUploadService fileUploadService;

    @Autowired
    FileDeleteService fileDeleteService;

    @Autowired
    PerlProcessService perlProcessService;

    @Autowired
    SessionParametersRepository sessionParametersRepository;

    @Autowired
    GroupNameFileProcessService groupNameFileProcessService;

    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    void uploadFile(MultipartHttpServletRequest request,
                    HttpServletResponse response,
                    @RequestParam(value = "from", required = true) String from,
                    @RequestParam(value = "column", required = true) Integer column,
                    @RequestParam(value = "sampleName", required = true) String sampleName,
                    @RequestParam(value = "session", required = true) Integer session,
                    @RequestParam(value = "session2", required = false) Integer session2
    ) throws IOException {

        // Getting uploaded files from the request object
        Map<String, MultipartFile> fileMap = request.getFileMap();

        // Maintain a list to send back the files info. to the client side
        List<InputStream> uploadedFiles = new ArrayList<InputStream>();
        // Iterate through the map
        for (MultipartFile multipartFile : fileMap.values()) {
            uploadedFiles.add(multipartFile.getInputStream());
        }
        fileUploadService.saveFile(uploadedFiles, from, session);
        if (from.contains("tpm")) {
            sessionParametersRepository.setParameters(session, new String[]{String.valueOf(column), sampleName, String.valueOf(session)});
            response.setStatus(HttpServletResponse.SC_OK);
        }
        if (from.equals("prefile")) {
            int port = perlProcessService.runFigure(sessionParametersRepository.getParameters(session));
            if (session2 != null) {
                fileUploadService.moveFile(from, session, session2);
                perlProcessService.runFigure(sessionParametersRepository.getParameters(session2));
            }
            response.setStatus(HttpServletResponse.SC_OK);
        }
    }

    @RequestMapping(value = "/uploadString", method = RequestMethod.POST)
    void uploadFile(HttpServletRequest request,
                    HttpServletResponse response,
                    @RequestParam(value = "file", required = true) String file,
                    @RequestParam(value = "session", required = true) Integer session,
                    @RequestParam(value = "session2", required = false) Integer session2
                    ) throws IOException {
        fileUploadService.saveFile(file,"prefile",session);
        if (session2 == null){
            perlProcessService.runFigure(sessionParametersRepository.getParameters(session));
        }
        else
        {
            perlProcessService.runFigure(sessionParametersRepository.getParameters(session));
            perlProcessService.runFigure(sessionParametersRepository.getParameters(session2));
        }
    }
    @RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
    void deleteFile(HttpServletRequest request,
                    HttpServletResponse response,
                    @RequestParam(value = "session", required = true) Integer session
    ) throws IOException {
        //delete file directory
        fileDeleteService.delete(session + "");
        System.out.println("Delete files in " + session);
    }

    @RequestMapping(value = "/getGroupNameFile", method = RequestMethod.POST)
    void getGroupNameFile(HttpServletRequest request,
                          HttpServletResponse response,
                          @RequestParam(value = "session", required = true) Integer session
    ) throws IOException {
        String s = new ObjectMapper().writeValueAsString(groupNameFileProcessService.process(session));
        response.getWriter().write(s);
        response.getWriter().flush();
        response.getWriter().close();
        response.flushBuffer();
    }

    @RequestMapping(value = "/getCompareText", method = RequestMethod.POST)
    void getCompareText(HttpServletRequest request,
                        HttpServletResponse response,
                        @RequestParam(value = "session", required = true) Integer session,
                        @RequestParam(value = "session1", required = false) Integer session1,
                        @RequestParam(value = "group1", required = true) String group1,
                        @RequestParam(value = "group2", required = true) String group2
    ) throws IOException {
        if (session1 == null) {// if comparision is inside of one tpm file
            String[] para = new String[]{
                    String.valueOf(session),
                    sessionParametersRepository.getParameters(session)[1],
                    sessionParametersRepository.getParameters(session)[0],
                    group1,
                    group2
            };
            String s = perlProcessService.runComparisioninOneFile(para);
            response.getWriter().write(s);
            response.getWriter().flush();
            response.getWriter().close();
            response.flushBuffer();
        } else { // if comparision is the groups between two files
            String[] para = new String[]{
                    String.valueOf(session),
                    String.valueOf(session1),
                    sessionParametersRepository.getParameters(session)[1],
                    sessionParametersRepository.getParameters(session)[0],
                    sessionParametersRepository.getParameters(session1)[1],
                    sessionParametersRepository.getParameters(session1)[0],
                    group1,
                    group2
            };
            String s = perlProcessService.runComparisionBetweenTwoFiles(para);
            response.getWriter().write(s);
            response.getWriter().flush();
            response.getWriter().close();
            response.flushBuffer();
        }
    }

    @RequestMapping(value = "/qqplot", method = RequestMethod.POST)
    void getCompareText(HttpServletRequest request,
                        HttpServletResponse response,
                        @RequestParam(value = "session", required = true) Integer session,
                        @RequestParam(value = "group", required = true) String group
    ) throws IOException {
        String[] para = new String[]{
                /**
                 * para[0]:sessionID
                 * para[1]:sampleName
                 * para[2]:col
                 * para[3]:group
                */
                String.valueOf(session),
                sessionParametersRepository.getParameters(session - 1)[1],
                sessionParametersRepository.getParameters(session - 1)[0],
                group
        };
        try {
            int s = perlProcessService.runQQPlot(para);
            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write(s);
            response.getWriter().flush();
            response.getWriter().close();
            response.flushBuffer();
        }
        catch (Exception e){
            e.printStackTrace();
        }

    }
}
