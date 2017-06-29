package com.bbs4m.forum.services;

import com.bbs4m.forum.entities.ForumTheme;

import java.util.List;

/**
 * Created by Jason on 28/06/2017.
 */
public interface RelatedForumService {
    List<ForumTheme> getRelatedForum(String themeId);
}
