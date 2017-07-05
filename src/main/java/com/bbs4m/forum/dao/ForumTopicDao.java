package com.bbs4m.forum.dao;

import com.bbs4m.forum.entities.ForumTopic;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Jason on 09/06/2017.
 */
@Component
public interface ForumTopicDao {
    ForumTopic getForumTopicById (String id);
    List<ForumTopic> getForumTopicByPilot(int currentPageNumber, int pageCount);
    ForumTopic getTopicPicById (String id);
}
