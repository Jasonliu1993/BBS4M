package com.bbs4m.forum.dao;

import com.bbs4m.forum.entities.ForumContent;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Jason on 06/06/2017.
 */
@Component
public interface ForumContentDao {
    ForumContent getFirstContentByThemeId(String themeId);
    String getReplyNumber (String themeId);
    ForumContent getLastReply (String themeId);
    List<ForumContent> getForumContentExcludeFirstContentByThemeid(String themeId, int currentPage, int pagRow);
    String getForumContentExcludeFirstContentCountByThemeId(String themeId);
    List<ForumContent> getForumJoinByUserId(@Param("currentPageNumber") int currentPageNumber, @Param("num") int num, @Param("userId") String userId);
    List<ForumContent> getForumByUserId(@Param("currentPageNumber") int currentPageNumber, @Param("num") int num, @Param("userId") String userId);
    String getForumJoinCountByUserId(String userid);
    String getForumCountByUserId(String userid);
    void updateLikeCount(String forumContentId);
    void updateDislikeCount(String forumContentId);
    long findMaxForumContentOrderId(String themeId);
    void saveNewContent(ForumContent forumContent);
}
