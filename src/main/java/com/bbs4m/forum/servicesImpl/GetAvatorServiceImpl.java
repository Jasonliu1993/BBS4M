package com.bbs4m.forum.servicesImpl;

import com.bbs4m.forum.dao.PersonalAvatorDao;
import com.bbs4m.forum.services.GetAvatorService;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * Created by Jason on 08/06/2017.
 */
@Component
public class GetAvatorServiceImpl implements GetAvatorService{

    @Resource
    PersonalAvatorDao personalAvatorDao;

    public byte[] getAvatorByUserId(String userId) {
        if (personalAvatorDao.getAvatorByUserId(userId) == null) {
            return personalAvatorDao.getAvatorByUserId("anonymitye").getPic();
        } else {
            return personalAvatorDao.getAvatorByUserId(userId).getPic();
        }
    }
}
