package com.gdcb.service;

import org.springframework.stereotype.Service;

import java.util.concurrent.atomic.AtomicBoolean;

@Service
public class ThreadLockingService {
    AtomicBoolean lock = new AtomicBoolean(false);
    public void setLock(boolean b){
        lock.set(b);
    }

    public AtomicBoolean getLock(){
        return lock;
    }
}
