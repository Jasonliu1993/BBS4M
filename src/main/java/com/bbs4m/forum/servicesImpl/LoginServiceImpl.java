package com.bbs4m.forum.servicesImpl;

import com.bbs4m.forum.dao.UserDataDao;
import com.bbs4m.forum.entities.UserData;
import com.bbs4m.forum.services.LoginService;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * Created by Jason on 25/06/2017.
 */
@Component
public class LoginServiceImpl implements LoginService {

    @Resource
    UserDataDao userDataDao;

    public UserData getAccess(String userId, String password) {
       return userDataDao.getUserData(userId, password);
    }
}
