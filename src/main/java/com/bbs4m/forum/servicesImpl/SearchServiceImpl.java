package com.bbs4m.forum.servicesImpl;

import com.bbs4m.forum.dao.FollowThemeDao;
import com.bbs4m.forum.dao.ForumContentDao;
import com.bbs4m.forum.dao.ForumThemeDao;
import com.bbs4m.forum.dao.TopicIncludeDao;
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
public class SearchServiceImpl implements SearchService{
    @Resource
    FollowThemeDao followThemeDao;

    @Resource
    ForumContentDao forumContentDao;

    @Resource
    ForumThemeDao forumThemeDao;

    @Resource
    TopicIncludeDao topicIncludeDao;

    public List<ForumTopic> getSearchTopic(String searchContent, int currentPageNumber, int pageCount) {
        return null;
    }

    public List<ForumTheme> getSearchForum(String searchContent, int currentPageNumber, int pageCount) {
        List<ForumTheme> forumThemes = forumThemeDao.getForumThemeByNamePilot((currentPageNumber - 1) * pageCount, pageCount,searchContent);

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
        return null;
    }
}
