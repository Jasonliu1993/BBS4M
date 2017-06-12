package com.bbs4m.forum.services;

import com.bbs4m.forum.entities.ForumContent;
import com.bbs4m.forum.entities.ForumTheme;

import java.util.List;

/**
 * Created by Jason on 12/06/2017.
 */
public interface GetForumDetailService {
    ForumTheme getCoreThemeAndContentByThemeId (String themeId);
    List<ForumContent> getReplyContentByThemeId (String themeId);
}
