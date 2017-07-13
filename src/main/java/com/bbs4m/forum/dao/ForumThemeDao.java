package com.bbs4m.forum.dao;

import com.bbs4m.forum.entities.ForumTheme;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Jason on 06/06/2017.
 */
@Component
public interface ForumThemeDao {
    List<ForumTheme> getForumThemeByPilot(@Param("currentPageNumber") int currentPageNumber,@Param("num") int num,@Param("topicId") String topicId);
    List<ForumTheme> getForumThemeByNamePilot(@Param("currentPageNumber") int currentPageNumber,@Param("num") int num,@Param("searchContent") String searchContent);
    String getThemeCount();
    String getThemeCountByName(String searchContent);
    ForumTheme getForumThemeByThemeId (String themeId);
    List<ForumTheme> getRelatedForumByThemeId(String themeId);
    void updateBrowse(String themeId);
    void saveForumTheme(ForumTheme forumTheme);
    List<ForumTheme> getForumThemeByName(String forumThemeName);
    List<ForumTheme> getForumThemeByUserId(String userId);
}
