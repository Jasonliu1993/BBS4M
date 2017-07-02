package com.bbs4m.forum.dao;

import com.bbs4m.forum.entities.ForumPic;
import org.springframework.stereotype.Component;

/**
 * Created by Jason on 13/06/2017.
 */
@Component
public interface ForumPicDao {
    ForumPic getForumPicByid(String id);
    void insertForumPic(ForumPic forumPic);
}
