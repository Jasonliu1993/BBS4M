package com.bbs4m.forum.servicesImpl;

import com.bbs4m.forum.dao.*;
import com.bbs4m.forum.entities.*;
import com.bbs4m.forum.services.AdminService;
import com.bbs4m.utilities.DateUtility;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Jason on 18/07/2017.
 */
@Component
public class AdminServiceImpl implements AdminService{

    @Resource
    PersonalInfoDao personalInfoDao;

    @Resource
    UserAttributeDao userAttributeDao;

    @Resource
    FollowUserDao followUserDao;

    @Resource
    ForumThemeDao forumThemeDao;

    @Resource
    ForumContentDao forumContentDao;

    public PersonalInfo getPersonalInfo(String id) {
        return personalInfoDao.getPersonalInfoByUserId(id);
    }

    public UserAttribute getUserAttribute(String id) {
        UserAttribute userAttribute = userAttributeDao.getUserAttributeByUserId(id);

        userAttribute.setFollowUsers(followUserDao.getAllFollowUserByFollowedUserId(userAttribute.getUserid()));
        userAttribute.setSendForum(Integer.toString((forumThemeDao.getForumThemeByUserId(userAttribute.getUserid())).size()));
        return userAttribute;
    }

    public List<FollowUser> getFollowedUserByUserId(String id) {
        return followUserDao.getFollowedUserByUserId(id);
    }

    public List<ForumTheme> getSendForumTheme(String id,int currentPageNumber, int pageCount) {
        List<ForumTheme> forumThemes = forumThemeDao.getForumThemeByUserIdPilot((currentPageNumber - 1) * pageCount, pageCount, id);
        for(ForumTheme forumTheme : forumThemes) {
            forumTheme.setReplyCount(forumContentDao.getReplyNumber(forumTheme.getId()));
            forumTheme.setFirstForumContent(forumContentDao.getFirstContentByThemeId(forumTheme.getId()));
            forumTheme.setDifferentTime(DateUtility.getTimeQuantum(DateUtility.getCurrentDate(), forumTheme.getCreateTime()));
        }
        return forumThemes;
    }

    public List<ForumContent> getForumJoin(String id, int currentPageNumber, int pageCount) {
        List<ForumContent> forumContents = forumContentDao.getForumJoinByUserId((currentPageNumber - 1) * pageCount,pageCount,id);
        for(ForumContent forumContent : forumContents) {
            forumContent.setDifferentTime(DateUtility.getTimeQuantum(DateUtility.getCurrentDate(), forumContent.getCreateTime()));
        }
        return forumContents;
    }

    public List<ForumContent> getForumFollow(String userId,int currentPageNumber, int pageCount) {
        List<ForumContent> forumContents = forumContentDao.getForumByUserId((currentPageNumber - 1) * pageCount,pageCount,userId);
        for(ForumContent forumContent : forumContents) {
            forumContent.setDifferentTime(DateUtility.getTimeQuantum(DateUtility.getCurrentDate(), forumContent.getCreateTime()));
        }
        return forumContents;
    }
}
