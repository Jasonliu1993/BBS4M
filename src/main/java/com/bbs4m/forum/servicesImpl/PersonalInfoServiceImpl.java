package com.bbs4m.forum.servicesImpl;

import com.bbs4m.forum.dao.PersonalInfoDao;
import com.bbs4m.forum.dao.PersonalSetupDao;
import com.bbs4m.forum.dao.UserAttributeDao;
import com.bbs4m.forum.entities.PersonalInfo;
import com.bbs4m.forum.entities.PersonalSetup;
import com.bbs4m.forum.entities.UserAttribute;
import com.bbs4m.forum.services.PersonalInfoService;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * Created by Jason on 25/06/2017.
 */
@Component
public class PersonalInfoServiceImpl implements PersonalInfoService{

    @Resource
    PersonalSetupDao personalSetupDao;

    @Resource
    UserAttributeDao userAttributeDao;

    @Resource
    PersonalInfoDao personalInfoDao;

    public PersonalSetup getPersonalSetupByUserId(String userId) {
        return personalSetupDao.getPersonalSetupByUserId(userId);
    }

    public PersonalInfo getPersonalInfoByUserId(String userId) {
        return personalInfoDao.getPersonalInfoByUserId(userId);
    }

    public UserAttribute getUserAttrByUserId(String userId) {
        return userAttributeDao.getUserAttributeByUserId(userId);
    }
}
