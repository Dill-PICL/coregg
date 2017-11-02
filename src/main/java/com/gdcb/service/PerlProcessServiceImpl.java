package com.gdcb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.IOException;

@Service
public class PerlProcessServiceImpl implements PerlProcessService{

    @Autowired
    protected ThreadLockingService threadLockingService;

    @Value("${perl_path}")
    protected String perl_path;

    @Value("${upload_path}")
    protected String absolute_path;

    /**
     * Run figure.pl
     * @param para
     * 0:col
     * 1:sampleName
     * 2:sessionID
     * @return the port that running web service
     * @throws IOException expection of running command
     */
    public int runFigure(String[] para) throws IOException {
        while (!threadLockingService.getLock().compareAndSet(false, true)) {
        }
        try {
            String command = "perl";
            String runFile = perl_path + "bin/figure.pl";
            String tpmFile = "tpm";
            String col = para[0];
            String sampleName = para[1];
            String pre_defined = "prefile";
            String session = para[2];
            String dir = absolute_path + session;
            String runCMD = command + " " + runFile + " " + tpmFile + " " + col + " " + sampleName + " " + pre_defined + " " + dir + " " + session + " " + "hkg";
            System.out.println("Run " + runCMD);
            Runtime.getRuntime().exec(runCMD);
            return Integer.valueOf(session);
        }finally {
            threadLockingService.getLock().set(false);
        }
    }
    /**
     * Run qqplot.pl
     * @param para
     * para[0]:sessionID
     * para[1]:sampleName
     * para[2]:col
     * para[3]:group
     * @return the port that running web service
     * @throws IOException expection of running command
     */
    @Override
    public int runQQPlot(String[] para) throws IOException {
        while (!threadLockingService.getLock().compareAndSet(false, true)) {
        }
        try {
            String command = "perl";
            String runFile = perl_path+"bin/qqplot.pl";
            String groupNameFile = "group_name_file";
            String session = para[0];
            String dir = absolute_path+(Integer.valueOf(session)-1);
            String RFile = para[1]+"_"+para[2]+"_R_input";
            String output = "abc";
            String runCMD = command+" "+runFile+" "+groupNameFile+" "+dir +" "+RFile+" "+output+" "+para[1]+" "+session+" "+para[3];
            System.out.println("Run "+runCMD);
            Process process = Runtime.getRuntime().exec(runCMD);
            return Integer.valueOf(para[0]);
        }finally {
            threadLockingService.getLock().set(false);
        }
    }


    /**
     * Run write_r_script_within_sample_test.pl
     * @param para
     * para[0]:sessionID
     * para[1]:sampleName
     * para[2]:col
     * para[3]:group1
     * para[4]:group2
     * @throws IOException
     */
    @Override
    public String runComparisioninOneFile(String[] para) throws IOException {
        while (!threadLockingService.getLock().compareAndSet(false, true)) {
        }
        try {
            String command = "perl";
            String runFile = perl_path+"bin/write_r_script_within_sample_test.pl";
            String groupNameFile = "group_name_file";
            String session = para[0];
            String dir = absolute_path+session;
            String RFile = para[1]+"_"+para[2]+"_R_input";
            String output = "abc";
            String runCMD = command+" "+runFile+" "+groupNameFile+" "+dir +" "+RFile+" "+output+" "+para[3]+" "+para[4];
            System.out.println("Run "+runCMD);
            Process process = Runtime.getRuntime().exec(runCMD);
            String s = org.apache.commons.io.IOUtils.toString(process.getInputStream(),"utf-8");
            String[] strs = s.split("\n");
            StringBuffer sb = new StringBuffer();
            for(int i = 4; i < strs.length; i++){
                sb.append(strs[i]);
                sb.append("\n");
            }
            return sb.toString();
        }finally {
            threadLockingService.getLock().set(false);
        }
    }
    /**
     * Run write_r_script_cross_sample_test.pl
     * @param para
     * para[0]:sessionID in first file
     * para[1]:SessionID in second file
     * para[2]:sampleName1
     * para[3]:col1
     * para[4]:sampleName2
     * para[5]:col2
     * para[6]:group1
     * para[7]:group2
     * @throws IOException
     */
    @Override
    public String runComparisionBetweenTwoFiles(String[] para) throws IOException {
        while (!threadLockingService.getLock().compareAndSet(false, true)) {
        }
        try {
            String command = "perl";
            String runFile = perl_path+"bin/write_r_script_across_sample_test.pl";
            String groupNameFile = "group_name_file";
            String session1 = para[0];
            String dir1 = absolute_path+session1;
            String session2 = para[1];
            String dir2 = absolute_path+session2;
            String RFile1 = para[2]+"_"+para[3]+"_R_input";
            String RFile2 = para[4]+"_"+para[5]+"_R_input";
            String output = "abc.r";
            String runCMD = command+" "+runFile+" "+groupNameFile+" "+dir1 +" "+RFile1+" "+groupNameFile+" "+dir2+" "+RFile2+" "+output+" "+para[6]+" "+para[7];
            System.out.println("Run "+runCMD);
            Process process = Runtime.getRuntime().exec(runCMD);
            String s = org.apache.commons.io.IOUtils.toString(process.getInputStream(),"utf-8");
            String[] strs = s.split("\n");
            StringBuffer sb = new StringBuffer();
            for(int i = 4; i < strs.length; i++){
                sb.append(strs[i]);
                sb.append("\n");
            }
            return sb.toString();
        }finally {
            threadLockingService.getLock().set(false);
        }
    }
}
