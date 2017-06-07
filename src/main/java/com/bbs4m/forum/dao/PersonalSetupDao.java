package com.bbs4m.forum.dao;

import com.bbs4m.forum.entities.PersonalSetup;
import org.springframework.stereotype.Component;

/**
 * Created by Jason on 06/06/2017.
 */
@Component
public interface PersonalSetupDao {
    PersonalSetup getPersonalSetupByUserId(String userId);
}
