package com.bbs4m.forum.servicesImpl;

import com.bbs4m.forum.dao.*;
import com.bbs4m.forum.entities.*;
import com.bbs4m.forum.services.GetForumDetailService;
import com.bbs4m.utilities.DateUtility;
import com.bbs4m.utilities.KeyValue;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Resource
    ForumPicDao forumPicDao;

    @Resource
    UserDataDao userDataDao;

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

    public void saveNewContent(HttpSession session, String themeId, String content, MultipartFile file, String followThemeButton, String anonymitye) {
        String creater = ((UserAttribute)session.getAttribute("UserAttr")).getUserid();
        ForumContent forumContent = new ForumContent();

        forumContent.setId(KeyValue.getKeyValue());
        forumContent.setOrderNumber(forumContentDao.findMaxForumContentOrderId(themeId) + 1);
        forumContent.setThemeRefId(themeId);
        forumContent.setContent(content);
        if (file.getSize() != 0) {
            try {
                System.out.println("file content:" + file.getBytes().toString());
            } catch (IOException e) {
                e.printStackTrace();
            }
            String fileKeyId = KeyValue.getKeyValue();
            forumContent.setPicFlag("Y");
            forumContent.setPicId(fileKeyId);

            ForumPic forumPic = new ForumPic();
            try {
                forumPic.setId(fileKeyId);
                forumPic.setPic(file.getBytes());
                forumPicDao.insertForumPic(forumPic);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            forumContent.setPicFlag("N");
        }

        if (anonymitye == null) {
            forumContent.setAnonymitye("N");
        } else {
            forumContent.setAnonymitye("Y");
        }

        if (followThemeButton != null) {
            if("Y".equals(followThemeDao.getFollowedThemeButtonFlag(content,themeId))) {

            } else {
                FollowTheme followTheme = new FollowTheme();
                followTheme.setId(KeyValue.getKeyValue());
                followTheme.setThemeRefId(themeId);
                followTheme.setUserid(creater);
                followThemeDao.insertFollowTheme(followTheme);
            }
        }
        forumContent.setCreater(creater);
        forumContent.setCreateTime(DateUtility.getCurrentDate());
        forumContentDao.saveNewContent(forumContent);
    }

    public Map<String ,String> saveForumContentReply(String currentUser, String contentId, String subPersonId,String replyContent) {
        Map<String ,String> map = new HashMap<String, String>();
        ForumContentReply forumContentReply = new ForumContentReply();
        forumContentReply.setId(KeyValue.getKeyValue());
        forumContentReply.setContentRefId(contentId);
        forumContentReply.setContentSubperson(subPersonId);
        forumContentReply.setContent(replyContent);
        forumContentReply.setCreater(currentUser);
        String dateTime = DateUtility.getCurrentDate();
        String dateTimeOutput = dateTime.substring(0,10);
        forumContentReply.setCreateTime(dateTime);
        forumContentReplyDao.insertForumContentReply(forumContentReply);
        map.put("dateTime",dateTimeOutput);
        map.put("replyName",userDataDao.getUserName(currentUser));
        return map;
    }
}
