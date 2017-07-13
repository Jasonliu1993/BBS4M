package com.bbs4m.forum.servicesImpl;

import com.bbs4m.forum.dao.*;
import com.bbs4m.forum.entities.FollowUser;
import com.bbs4m.forum.entities.ForumTheme;
import com.bbs4m.forum.entities.ForumTopic;
import com.bbs4m.forum.entities.UserAttribute;
import com.bbs4m.forum.services.SearchService;
import com.bbs4m.utilities.DateUtility;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Jason on 12/07/2017.
 */
@Component
public class SearchServiceImpl implements SearchService {
    @Resource
    FollowThemeDao followThemeDao;

    @Resource
    ForumContentDao forumContentDao;

    @Resource
    ForumThemeDao forumThemeDao;

    @Resource
    TopicIncludeDao topicIncludeDao;

    @Resource
    ForumTopicDao forumTopicDao;

    @Resource
    UserAttributeDao userAttributeDao;

    @Resource
    FollowUserDao followUserDao;

    public List<ForumTopic> getSearchTopic(String searchContent, int currentPageNumber, int pageCount) {
        List<ForumTopic> forumTopics = forumTopicDao.getForumTopicByName(currentPageNumber - 1, pageCount, searchContent);
        for (ForumTopic forumTopic : forumTopics) {
            if (forumTopic.getComments().length() > 50) {
                System.out.println("+++++Comments legnth:" + forumTopic.getComments().length());
                forumTopic.setComments(forumTopic.getComments().substring(1, 50) + "...");
            }
        }
        return forumTopics;
    }

    public List<ForumTheme> getSearchForum(String searchContent, int currentPageNumber, int pageCount) {
        List<ForumTheme> forumThemes = forumThemeDao.getForumThemeByNamePilot((currentPageNumber - 1) * pageCount, pageCount, searchContent);

        for (ForumTheme forumTheme : forumThemes) {
            forumTheme.setFollowThemes(followThemeDao.getFollowThemeByThemeId(forumTheme.getId()));
            forumTheme.setFirstForumContent(forumContentDao.getFirstContentByThemeId(forumTheme.getId()));
            forumTheme.setTopicIncludes(topicIncludeDao.getTopicIncludeByThemeId(forumTheme.getId()));
            forumTheme.setReplyCount(forumContentDao.getReplyNumber(forumTheme.getId()));
            forumTheme.setDifferentTime(DateUtility.getTimeQuantum(DateUtility.getCurrentDate(), forumContentDao.getLastReply(forumTheme.getId()).getCreateTime()));
            forumTheme.setLastReplyContent(forumContentDao.getLastReply(forumTheme.getId()));
        }
        return forumThemes;
    }

    public List<UserAttribute> getSearchPerson(String searchContent, int currentPageNumber, int pageCount) {
        List<UserAttribute> userAttributes = userAttributeDao.getUserAttributeByName((currentPageNumber - 1) * pageCount,pageCount,searchContent);
        for(UserAttribute userAttribute : userAttributes) {
            userAttribute.setFollowUsers(followUserDao.getAllFollowUserByFollowedUserId(userAttribute.getUserid()));
            userAttribute.setSendForum(Integer.toString((forumThemeDao.getForumThemeByUserId(userAttribute.getUserid())).size()));
        }
        return userAttributes;
    }
}
