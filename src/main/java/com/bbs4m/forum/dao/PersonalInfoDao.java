package com.bbs4m.forum.dao;

import com.bbs4m.forum.entities.PersonalInfo;
import org.springframework.stereotype.Component;

/**
 * Created by Jason on 25/06/2017.
 */
@Component
public interface PersonalInfoDao {
    PersonalInfo getPersonalInfoByUserId(String userId);
}
