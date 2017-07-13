package com.bbs4m.forum.dao;

import com.bbs4m.forum.entities.UserAttribute;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Jason on 12/06/2017.
 */
@Component
public interface UserAttributeDao {
    UserAttribute getUserAttributeByUserId(String userId);
    void updateUserScore(String userId, int Score);
    List<UserAttribute> getUserAttributeByName(@Param("currentPageNumber") int currentPageNumber, @Param("pageCount") int pageCount, @Param("searchContent") String searchContent);
    String getUserAttributeCountByName(String searchContent);
}
