package com.bbs4m.forum.servicesImpl;

import com.bbs4m.forum.dao.*;
import com.bbs4m.forum.entities.*;
import com.bbs4m.forum.services.GetForumDetailService;
import com.bbs4m.utilities.KeyValue;
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
    FollowThemeDao followThemeDao;

    @Resource
    ForumContentDao forumContentDao;

    @Resource
    UserAttributeDao userAttributeDao;

    @Resource
    TopicIncludeDao topicIncludeDao;

    @Resource
    ForumContentReplyDao forumContentReplyDao;

    @Resource
    FollowUserDao followUserDao;

    public ForumTheme getCoreThemeAndContentByThemeId(String themeId) {
        ForumTheme forumTheme = forumThemeDao.getForumThemeByThemeId(themeId);
        forumTheme.setFirstForumContent(forumContentDao.getFirstContentByThemeId(themeId));
        forumTheme.setCreaterUserAttribute(userAttributeDao.getUserAttributeByUserId(forumTheme.getCreater()));
        forumTheme.setTopicIncludes(topicIncludeDao.getTopicIncludeByThemeId(forumTheme.getId()));
        forumTheme.setReplyCount(forumContentDao.getReplyNumber(forumTheme.getId()));
        return forumTheme;
    }

    public List<ForumContent> getReplyContentByThemeId(String themeId, int currentPage, int pagRow) {
        List<ForumContent> forumContentsExcludeFirstContentByThemeId = forumContentDao.getForumContentExcludeFirstContentByThemeid(themeId, (currentPage - 1) * pagRow, pagRow);
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

    public void updateBrowse(String themeId) {
        forumThemeDao.updateBrowse(themeId);
    }

    public void insertFollowUser(String userId, String followedUser) {
        if (followUserDao.getFollowedButtonFlag(userId,followedUser) == null) {
            FollowUser followUser = new FollowUser();
            followUser.setId(KeyValue.getKeyValue());
            followUser.setFollowedUserid(followedUser);
            followUser.setUserid(userId);
            followUserDao.insertFollowUser(followUser);
        }
    }

    public void insertFollowTheme(String userId, String followedTheme) {
        if (followThemeDao.getFollowedThemeButtonFlag(userId,followedTheme) == null) {
            FollowTheme followTheme = new FollowTheme();
            followTheme.setId(KeyValue.getKeyValue());
            followTheme.setUserid(userId);
            followTheme.setThemeRefId(followedTheme);
            followThemeDao.insertFollowTheme(followTheme);
        }
    }

    public String getFollowedButtonFlag(String userId, String followedUser) {
        if (userId == null) {
            return "N";
        } else {
            if (followUserDao.getFollowedButtonFlag(userId,followedUser) == null)
                return "N";
            else
                return "Y";
        }
    }

    public String getFollowedThemeButtonFlag(String userId, String followedTheme) {
        if (userId == null) {
            return "N";
        } else {
            if (followThemeDao.getFollowedThemeButtonFlag(userId,followedTheme) == null)
                return "N";
            else
                return "Y";
        }
    }

    public void updateLikeCount(String forumContentId) {
        forumContentDao.updateLikeCount(forumContentId);
    }

    public void updateDislikeCount(String forumContentId) {
        forumContentDao.updateDislikeCount(forumContentId);
    }
}
