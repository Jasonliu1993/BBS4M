package com.bbs4m.forum.dao;

import com.bbs4m.forum.entities.ForumContentReply;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Jason on 15/06/2017.
 */
@Component
public interface ForumContentReplyDao {
    String getReplyCountByContentId (String id);
    List<ForumContentReply> getForumContentReplyByContentId (String ContentId);
    void insertForumContentReply(ForumContentReply forumContentReply);
}
