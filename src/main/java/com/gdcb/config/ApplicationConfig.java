package com.gdcb.config;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.guava.GuavaModule;
import com.gdcb.service.FileDeleteService;
import com.gdcb.service.GroupNameFileProcessService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import java.io.IOException;

/**
 * The configuation file for application
 *
 * @author Chenguang He
 * @email gaoyike@gmail.com
 */
@Configuration
public class ApplicationConfig {
    private static final Logger logger = LoggerFactory.getLogger(ApplicationConfig.class);
    @Autowired
    FileDeleteService deleteService;

    @Autowired
    GroupNameFileProcessService groupNameFileProcessService;

    @Value("${upload_path}")
    private String absolute_path;
    /**
     * --- Object Mapper ---
     */


    /**
     * The json mapper
     * @return
     */
    @Bean
    public ObjectMapper objectMapper() {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.enable(SerializationFeature.INDENT_OUTPUT);
        objectMapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);
        objectMapper.registerModule(new GuavaModule());
        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        return objectMapper;
    }

    @Bean
    public CommonsMultipartResolver multipartResolver() {
        CommonsMultipartResolver resolver=new CommonsMultipartResolver();
        resolver.setDefaultEncoding("utf-8");
        return resolver;
    }

    /**
     * for test
     * @throws IOException
     */
    @PostConstruct
    public void init() throws IOException {
    }


    @PreDestroy
    public void clearDownloadDirectory() throws IOException {
        deleteService.delete(absolute_path);
    }


}
