package com.bbs4m.forum.services;

import com.bbs4m.forum.entities.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by Jason on 12/06/2017.
 */
public interface GetForumDetailService {
    ForumTheme getCoreThemeAndContentByThemeId (String themeId);
    List<ForumContent> getReplyContentByThemeId (String themeId, int currentPage, int pagRow);
    List<ForumContentReply> getReplyContentByContentId (String ContentId);
    void updateBrowse(String themeId);
    void insertFollowUser(String userId, String followedUser);
    String getFollowedButtonFlag(String userId, String followedUser);
    void insertFollowTheme(String userId, String followedTheme);
    String getFollowedThemeButtonFlag(String userId, String followedTheme);
    void updateLikeCount(String forumContentId);
    void updateDislikeCount(String forumContentId);
    void saveNewContent(HttpSession session,String themeId, String content, MultipartFile file, String followThemeButton, String anonymitye);
    Map<String ,String> saveForumContentReply(String currentUser, String contentId, String subPersonId, String replyContent);
    String saveForumTheme(String topicId, String forumTheme, String forumContent, String userId, MultipartFile file);
    List<ForumTheme> getForumThemeByName (String forumTheme);
    void updateReplyRemind(String themeId,String userId);
}
