package com.bbs4m.forum.services;

import com.bbs4m.forum.entities.*;

import java.util.List;

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
}
