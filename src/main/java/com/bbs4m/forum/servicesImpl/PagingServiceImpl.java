package com.bbs4m.forum.servicesImpl;

import com.bbs4m.forum.dao.ForumContentDao;
import com.bbs4m.forum.dao.ForumThemeDao;
import com.bbs4m.forum.services.PagingService;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * Created by Jason on 25/06/2017.
 */
@Component
public class PagingServiceImpl implements PagingService {

    @Resource
    ForumThemeDao forumThemeDao;

    @Resource
    ForumContentDao forumContentDao;

    public String judgeLoadButton(int currentPageNumber, int num, String object, String Id) {
        if ("theme".equals(object)) {
            int count = Integer.parseInt(forumThemeDao.getThemeCount());
            if ((currentPageNumber * num) >= count) {
                return "N";
            } else {
                return "Y";
            }
        } else if ("content".equals(object)) {
            int count = Integer.parseInt(forumContentDao.getForumContentExcludeFirstContentCountByThemeId(Id));
            if (((currentPageNumber + 1 ) * num) >= count) {
                return "N";
            } else {
                return "Y";
            }
        }
        return "Y";
    }
}
