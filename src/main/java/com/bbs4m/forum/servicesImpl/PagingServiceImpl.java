package com.bbs4m.forum.servicesImpl;

import com.bbs4m.forum.dao.ForumContentDao;
import com.bbs4m.forum.dao.ForumThemeDao;
import com.bbs4m.forum.dao.ForumTopicDao;
import com.bbs4m.forum.dao.TopicIncludeDao;
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

    @Resource
    ForumTopicDao forumTopicDao;

    @Resource
    TopicIncludeDao topicIncludeDao;

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
            if (((currentPageNumber ) * num) >= count) {
                return "N";
            } else {
                return "Y";
            }
        } else if ("topic".equals(object)) {
            int count = Integer.parseInt(forumTopicDao.getTopicCount());
            if (((currentPageNumber ) * num) >= count) {
                return "N";
            } else {
                return "Y";
            }
        } else if ("topicForum".equals(object)) {
            int count = Integer.parseInt(topicIncludeDao.getTopicForumCountByTopicId(Id));
            System.out.print("++++++++++count++++++++++++" + count);
            System.out.print("++++++++++currentcount++++++++++++" + ((currentPageNumber ) * num));
            if (((currentPageNumber ) * num) >= count) {
                return "N";
            } else {
                return "Y";
            }
        }
        return "Y";
    }
}
