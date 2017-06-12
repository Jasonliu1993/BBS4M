package com.bbs4m.forum.dao;

import com.bbs4m.forum.entities.UserAttribute;
import org.springframework.stereotype.Component;

/**
 * Created by Jason on 12/06/2017.
 */
@Component
public interface UserAttributeDao {
    UserAttribute getUserAttributeByUserId(String userId);
}
