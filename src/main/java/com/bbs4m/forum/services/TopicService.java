package com.bbs4m.forum.services;

import com.bbs4m.forum.entities.ForumTopic;

import java.util.List;

/**
 * Created by Jason on 04/07/2017.
 */
public interface TopicService {
    List<ForumTopic> getForumTopicByPilot(int currentPageNumber, int pageCount);
    byte[] getTopicPicById (String id);
    ForumTopic getForumTopicById(String id);
}
