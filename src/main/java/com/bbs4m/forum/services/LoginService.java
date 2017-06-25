package com.bbs4m.forum.services;

import com.bbs4m.forum.entities.UserData;

/**
 * Created by Jason on 25/06/2017.
 */
public interface LoginService {
    UserData getAccess(String userId, String password);
}
