package com.bbs4m.forum.servicesImpl;

import com.bbs4m.forum.dao.*;
import com.bbs4m.forum.entities.ForumContent;
import com.bbs4m.forum.entities.ForumContentReply;
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

    @Resource
    ForumContentReplyDao forumContentReplyDao;

    public ForumTheme getCoreThemeAndContentByThemeId(String themeId) {
        ForumTheme forumTheme = forumThemeDao.getForumThemeByThemeId(themeId);
        forumTheme.setFirstForumContent(forumContentDao.getFirstContentByThemeId(themeId));
        forumTheme.setCreaterUserAttribute(userAttributeDao.getUserAttributeByUserId(forumTheme.getCreater()));
        forumTheme.setTopicIncludes(topicIncludeDao.getTopicIncludeByThemeId(forumTheme.getId()));
        forumTheme.setReplyCount(forumContentDao.getReplyNumber(forumTheme.getId()));
        return forumTheme;
    }

    public List<ForumContent> getReplyContentByThemeId(String themeId) {
        List<ForumContent> forumContentsExcludeFirstContentByThemeId = forumContentDao.getForumContentExcludeFirstContentByThemeid(themeId);
        for (ForumContent forumContent : forumContentsExcludeFirstContentByThemeId) {
            forumContent.setReplyCount(forumContentReplyDao.getReplyCountByContentId(forumContent.getId()));
        }
        return forumContentsExcludeFirstContentByThemeId;
    }

    public List<ForumContentReply> getReplyContentByContentId(String contentId) {
        List<ForumContentReply> forumContentReplies = forumContentReplyDao.getForumContentReplyByContentId(contentId);
        for (ForumContentReply forumContentReply : forumContentReplies) {
            forumContentReply.setUserAttribute(userAttributeDao.getUserAttributeByUserId(forumContentReply.getCreater()));
        }
        return forumContentReplies;
    }
}
