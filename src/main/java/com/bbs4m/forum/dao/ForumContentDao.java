package com.bbs4m.forum.dao;

import com.bbs4m.forum.entities.ForumContent;
import com.bbs4m.forum.entities.ForumTheme;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Jason on 06/06/2017.
 */
@Component
public interface ForumContentDao {
    List<ForumContent> getFirstAndLastContentByThemeId(String themeId);
    String getReplyNumber (String themeId);
    ForumContent getLastReply (String themeId);
}