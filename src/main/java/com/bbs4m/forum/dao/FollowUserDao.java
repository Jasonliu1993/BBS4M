package com.bbs4m.forum.dao;

import com.bbs4m.forum.entities.FollowUser;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Jason on 12/06/2017.
 */
@Component
public interface FollowUserDao {
    List<FollowUser> getAllFollowUserByFollowedUserId (String followedUserId);
    void insertFollowUser(FollowUser followUser);
}
