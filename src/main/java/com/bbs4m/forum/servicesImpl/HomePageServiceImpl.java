package com.bbs4m.forum.servicesImpl;

import com.bbs4m.forum.dao.*;
import com.bbs4m.forum.entities.ForumTheme;
import com.bbs4m.forum.entities.TopicInclude;
import com.bbs4m.forum.services.HomePageService;
import com.bbs4m.utilities.DateUtility;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by Jason on 06/06/2017.
 */
@Component
public class HomePageServiceImpl implements HomePageService {

    @Resource
    FollowThemeDao followThemeDao;

    @Resource
    ForumContentDao forumContentDao;

    @Resource
    ForumThemeDao forumThemeDao;

    @Resource
    TopicIncludeDao topicIncludeDao;

    public List<ForumTheme> getHomePageList(int currentPageNumber, int num, String topicId) {
        List<ForumTheme> forumThemes = forumThemeDao.getForumThemeByPilot((currentPageNumber - 1) * num, num, topicId);

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
}
