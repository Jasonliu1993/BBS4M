package com.bbs4m.forum.services;

import com.bbs4m.forum.entities.ForumTheme;
import com.bbs4m.forum.entities.ForumTopic;
import com.bbs4m.forum.entities.UserAttribute;

import java.util.List;

/**
 * Created by Jason on 12/07/2017.
 */
public interface SearchService {
    List<ForumTopic> getSearchTopic(String searchContent, int currentPageNumber, int pageCount);
    List<ForumTheme> getSearchForum(String searchContent, int currentPageNumber, int pageCount);
    List<UserAttribute> getSearchPerson(String searchContent, int currentPageNumber, int pageCount);
}
