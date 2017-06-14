package com.bbs4m.forum.servicesImpl;

import com.bbs4m.forum.dao.ForumContentDao;
import com.bbs4m.forum.dao.ForumThemeDao;
import com.bbs4m.forum.dao.TopicIncludeDao;
import com.bbs4m.forum.dao.UserAttributeDao;
import com.bbs4m.forum.entities.ForumContent;
import com.bbs4m.forum.entities.ForumTheme;
import com.bbs4m.forum.services.GetForumDetailService;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Jason on 12/06/2017.
 */
@Component
public class GetForumDetailServiceImpl implements GetForumDetailService{

    @Resource
    ForumThemeDao forumThemeDao;

    @Resource
    ForumContentDao forumContentDao;

    @Resource
    UserAttributeDao userAttributeDao;

    @Resource
    TopicIncludeDao topicIncludeDao;

    public ForumTheme getCoreThemeAndContentByThemeId(String themeId) {
        ForumTheme forumTheme = forumThemeDao.getForumThemeByThemeId(themeId);
        forumTheme.setFirstForumContent(forumContentDao.getFirstContentByThemeId(themeId));
        forumTheme.setCreaterUserAttribute(userAttributeDao.getUserAttributeByUserId(forumTheme.getCreater()));
        forumTheme.setTopicIncludes(topicIncludeDao.getTopicIncludeByThemeId(forumTheme.getId()));
        forumTheme.setReplyCount(forumContentDao.getReplyNumber(forumTheme.getId()));
        return forumTheme;
    }

    public List<ForumContent> getReplyContentByThemeId(String themeId) {
        return null;
    }
}
