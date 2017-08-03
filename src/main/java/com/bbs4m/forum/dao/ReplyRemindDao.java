package com.bbs4m.forum.dao;

import com.bbs4m.forum.entities.ReplyRemind;
import org.springframework.stereotype.Component;

/**
 * Created by Jason on 02/08/2017.
 */
@Component
public interface ReplyRemindDao {
    void insertRemind(ReplyRemind replyRemind);
    void updateRemind(ReplyRemind replyRemind);
}
