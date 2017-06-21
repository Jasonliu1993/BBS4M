package com.bbs4m.forum.dao;

import org.springframework.stereotype.Component;

/**
 * Created by Jason on 15/06/2017.
 */
@Component
public interface ForumContentReplyDao {
    String getReplyCountByContentId (String id);
}
