package com.bbs4m.forum.dao;

import com.bbs4m.forum.entities.FollowTheme;
import com.bbs4m.forum.entities.ForumTheme;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Jason on 06/06/2017.
 */
@Component(value = "followThemeDao")
public interface FollowThemeDao {
    List<FollowTheme> getFollowThemeByThemeId(String themeId);
    void insertFollowTheme(FollowTheme followTheme);
    String getFollowedThemeButtonFlag(String userId, String followedThemeId);
}
