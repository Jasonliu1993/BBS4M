package com.bbs4m.forum.servicesImpl;

import com.bbs4m.forum.dao.*;
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

    @Resource
    UserAttributeDao userAttributeDao;

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
            if (((currentPageNumber) * num) >= count) {
                return "N";
            } else {
                return "Y";
            }
        } else if ("topic".equals(object)) {
            int count = Integer.parseInt(forumTopicDao.getTopicCount());
            if (((currentPageNumber) * num) >= count) {
                return "N";
            } else {
                return "Y";
            }
        } else if ("topicForum".equals(object)) {
            int count = Integer.parseInt(topicIncludeDao.getTopicForumCountByTopicId(Id));
            System.out.print("++++++++++count++++++++++++" + count);
            System.out.print("++++++++++currentcount++++++++++++" + ((currentPageNumber) * num));
            if (((currentPageNumber) * num) >= count) {
                return "N";
            } else {
                return "Y";
            }
        } else if ("searchForum".equals(object)) {
            int count = Integer.parseInt(forumThemeDao.getThemeCountByName(Id));
            System.out.println("++++++++++count++++++++++++" + count);
            System.out.println("++++++++++currentcount++++++++++++" + ((currentPageNumber) * num));
            System.out.println("++++++++++currentPageNumber++++++++++++" + currentPageNumber);
            System.out.println("++++++++++num++++++++++++" + num);
            System.out.println("++++++++++object++++++++++++" + object);
            if (((currentPageNumber) * num) >= count) {
                return "N";
            } else {
                return "Y";
            }
        } else if ("searchTopic".equals(object)) {
            int count = Integer.parseInt(forumTopicDao.getForumTopicByNameCount(Id));
            if (((currentPageNumber) * num) >= count) {
                return "N";
            } else {
                return "Y";
            }
        }else if ("searchPerson".equals(object)) {
            int count = Integer.parseInt(userAttributeDao.getUserAttributeCountByName(Id));
            if (((currentPageNumber) * num) >= count) {
                return "N";
            } else {
                return "Y";
            }
        }else if ("sendForumTheme".equals(object)) {
            int count = Integer.parseInt(forumThemeDao.getThemeCountByUserId(Id));
            if (((currentPageNumber) * num) >= count) {
                return "N";
            } else {
                return "Y";
            }
        }else if ("ForumJoinTheme".equals(object)) {
            int count = Integer.parseInt(forumContentDao.getForumJoinCountByUserId(Id));
            System.out.println("++++++++++count++++++++++++" + count);
            System.out.println("++++++++++currentcount++++++++++++" + ((currentPageNumber) * num));
            System.out.println("++++++++++currentPageNumber++++++++++++" + currentPageNumber);
            System.out.println("++++++++++num++++++++++++" + num);
            System.out.println("++++++++++object++++++++++++" + object);
            if (((currentPageNumber) * num) >= count) {
                return "N";
            } else {
                return "Y";
            }
        }
        return "Y";
    }
}
