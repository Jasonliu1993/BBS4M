package com.bbs4m.forum.services;

import com.bbs4m.forum.entities.FollowUser;
import com.bbs4m.forum.entities.ForumTheme;
import com.bbs4m.forum.entities.PersonalInfo;
import com.bbs4m.forum.entities.UserAttribute;

import java.util.List;

/**
 * Created by Jason on 18/07/2017.
 */
public interface AdminService {
    PersonalInfo getPersonalInfo(String id);
    UserAttribute getUserAttribute(String id);
    List<FollowUser> getFollowedUserByUserId(String id);
    List<ForumTheme> getSendForumTheme(String id,int currentPageNumber, int pageCount);
}
