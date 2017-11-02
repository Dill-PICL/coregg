package com.gdcb.controller;

import com.gdcb.service.ThreadLockingService;
import com.google.common.io.Files;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

@Controller
public class FileContorller {
    @Autowired
    ServletContext context;

    @Value("${upload_path}")
    private String absolute_path;

    @Autowired
    private ThreadLockingService threadLockingService;

    @RequestMapping(value = "/files/{session}/{fileName:.+}", method = RequestMethod.GET)
    void getCompareText(HttpServletRequest request,
                        HttpServletResponse response,
                        @PathVariable(value = "session") Integer session,
                        @PathVariable(value = "fileName") String fileName
    ) throws IOException {
        while (!threadLockingService.getLock().compareAndSet(false,true)) {
        }
        try {
            File file = new File(absolute_path + session, fileName);
            response.setHeader("Content-Type", context.getMimeType(fileName));
            response.setHeader("Content-Length", String.valueOf(file.length()));
            response.setHeader("Content-Disposition", "inline; filename=\"" + file.getName() + "\"");
            Files.copy(file, response.getOutputStream());
        } catch (FileNotFoundException f) {

        }
        finally {
            threadLockingService.getLock().set(false);
        }
    }
}
