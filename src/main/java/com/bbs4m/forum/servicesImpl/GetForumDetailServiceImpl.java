package com.bbs4m.forum.servicesImpl;

import com.bbs4m.forum.dao.*;
import com.bbs4m.forum.entities.*;
import com.bbs4m.forum.services.GetForumDetailService;
import com.bbs4m.forum.services.WebSocketService;
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

    @Resource
    WebSocketService webSocketService;

    @Resource
    ReplyRemindDao replyRemindDao;

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
        ReplyRemind replyRemind = new ReplyRemind();
        String forumContentId = KeyValue.getKeyValue();

        forumContent.setId(forumContentId);
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
        if (creater.equals(forumThemeDao.getThemeCreaterByThemeId(themeId))) {

        } else {
            forumContent.setCreater(creater);
            forumContent.setCreateTime(DateUtility.getCurrentDate());
            forumContentDao.saveNewContent(forumContent);

            replyRemind.setId(KeyValue.getKeyValue());
            replyRemind.setFlag("replyTheme");
            replyRemind.setReadFlag("N");
            replyRemind.setFromUserid(creater);
            replyRemind.setToUserid(forumThemeDao.getThemeCreaterByThemeId(themeId));
            replyRemind.setThemeId(themeId);
            replyRemind.setContentId(forumContentId);
            replyRemind.setCreateTime(DateUtility.getCurrentDate());

            replyRemindDao.insertRemind(replyRemind);
            webSocketService.sendMsg(forumThemeDao.getThemeCreaterByThemeId(themeId));
        }
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

    public String saveForumTheme(String topicId, String forumTheme, String forumContent, String userId, MultipartFile file) {
        String forumThemeid = KeyValue.getKeyValue();
        String forumContentId = KeyValue.getKeyValue();
        String forumPicId = KeyValue.getKeyValue();
        String currentDate = DateUtility.getCurrentDate();

        ForumTheme forumTheme1 = new ForumTheme();
        forumTheme1.setId(forumThemeid);
        forumTheme1.setThemeContent(forumTheme);
        forumTheme1.setCreater(userId);
        forumTheme1.setCreateTime(currentDate);
        forumTheme1.setBrowse(0);
        forumThemeDao.saveForumTheme(forumTheme1);

        ForumContent forumContent1 = new ForumContent();
        forumContent1.setId(forumContentId);
        forumContent1.setOrderNumber(1);
        forumContent1.setThemeRefId(forumThemeid);
        forumContent1.setContent(forumContent);
        if (file.getSize() != 0) {
            try {
                System.out.println("file content:" + file.getBytes().toString());
            } catch (IOException e) {
                e.printStackTrace();
            }
            forumContent1.setPicFlag("Y");
            forumContent1.setPicId(forumPicId);

            ForumPic forumPic = new ForumPic();
            try {
                forumPic.setId(forumPicId);
                forumPic.setPic(file.getBytes());
                forumPicDao.insertForumPic(forumPic);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            forumContent1.setPicFlag("N");
        }

        forumContent1.setAnonymitye("Y");

        forumContent1.setCreater(userId);
        forumContent1.setCreateTime(currentDate);
        forumContentDao.saveNewContent(forumContent1);

        TopicInclude topicInclude = new TopicInclude();

        if (topicId.indexOf("|") == -1) {
            topicInclude.setId(KeyValue.getKeyValue());
            topicInclude.setTopicId(topicId);
            topicInclude.setThemeRefId(forumThemeid);
            topicIncludeDao.saveTopicInclude(topicInclude);
        } else {
            String[] topiIdList = topicId.split("\\|");
            for(int i = 0; i < topiIdList.length; i++){
                topicInclude.setId(KeyValue.getKeyValue());
                topicInclude.setTopicId(topiIdList[i]);
                topicInclude.setThemeRefId(forumThemeid);
                topicIncludeDao.saveTopicInclude(topicInclude);
            }
        }
        userAttributeDao.updateUserScore(userId,1);
        return forumThemeid;
    }

    public List<ForumTheme> getForumThemeByName(String forumTheme) {
        return forumThemeDao.getForumThemeByName(forumTheme);
    }

    public void updateReplyRemind(String themeId, String userId) {
        replyRemindDao.updateRemindByTheme(themeId,userId);
    }
}
