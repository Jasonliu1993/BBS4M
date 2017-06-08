package com.bbs4m.forum.servicesImpl;

import com.bbs4m.forum.dao.*;
import com.bbs4m.forum.entities.ForumTheme;
import com.bbs4m.forum.entities.PersonalSetup;
import com.bbs4m.forum.services.HomePageService;
import com.bbs4m.utilities.DateUtility;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
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

    @Resource
    PersonalAvatorDao personalAvatorDao;

    @Resource
    PersonalSetupDao personalSetupDao;

    public List<ForumTheme> getHomePageList(int currentPageNumber, int num) {
        List<ForumTheme> forumThemes = forumThemeDao.getForumThemeByPilot(currentPageNumber,num);

        for (ForumTheme forumTheme : forumThemes) {
            forumTheme.setFollowThemes(followThemeDao.getFollowThemeByThemeId(forumTheme.getId()));
            forumTheme.setForumContents(forumContentDao.getFirstAndLastContentByThemeId(forumTheme.getId()));
            forumTheme.setTopicIncludes(topicIncludeDao.getTopicIncludeByThemeId(forumTheme.getId()));
            forumTheme.setReplyCount(forumContentDao.getReplyNumber(forumTheme.getId()));
            forumTheme.setDifferentTime(DateUtility.getTimeQuantum(DateUtility.getCurrentDate(),forumContentDao.getLastReply(forumTheme.getId()).getCreateTime()));
            forumTheme.setLastReplyContent(forumContentDao.getLastReply(forumTheme.getId()));
        }
        return forumThemes;
    }

    public PersonalSetup getPersoanlSetupByuserId(String userid) {
        return personalSetupDao.getPersonalSetupByUserId(userid);
    }
}
