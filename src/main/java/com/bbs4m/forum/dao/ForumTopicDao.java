package com.bbs4m.forum.dao;

import com.bbs4m.forum.entities.ForumTopic;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Jason on 09/06/2017.
 */
@Component
public interface ForumTopicDao {
    ForumTopic getForumTopicById (String id);
    List<ForumTopic> getForumTopicByPilot(int currentPageNumber, int pageCount);
    List<ForumTopic> getForumTopicByName(@Param("currentPageNumber") int currentPageNumber,@Param("pageCount") int pageCount,@Param("searchContent") String searchContent);
    String getForumTopicByNameCount(@Param("searchContent") String searchContent);
    ForumTopic getTopicPicById (String id);
    String getTopicCount ();
    List<ForumTopic> selectTopic(String TopicName);
}
