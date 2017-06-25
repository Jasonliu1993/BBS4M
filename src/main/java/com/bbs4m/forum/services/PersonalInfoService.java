package com.bbs4m.forum.services;

import com.bbs4m.forum.entities.PersonalInfo;
import com.bbs4m.forum.entities.PersonalSetup;
import com.bbs4m.forum.entities.UserAttribute;

/**
 * Created by Jason on 25/06/2017.
 */
public interface PersonalInfoService {
    PersonalSetup getPersonalSetupByUserId(String userId);

    PersonalInfo getPersonalInfoByUserId(String userId);

    UserAttribute getUserAttrByUserId(String userId);
}
