package com.bbs4m.forum.servicesImpl;

import com.bbs4m.forum.dao.ForumTopicDao;
import com.bbs4m.forum.entities.ForumTopic;
import com.bbs4m.forum.services.TopicService;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Jason on 04/07/2017.
 */
@Component
public class TopicServiceImpl implements TopicService {

    @Resource
    ForumTopicDao forumTopicDao;

    public List<ForumTopic> getForumTopicByPilot(int currentPageNumber, int pageCount) {
        List<ForumTopic> forumTopics = forumTopicDao.getForumTopicByPilot(currentPageNumber - 1,pageCount);
        for (ForumTopic forumTopic : forumTopics) {
            if (forumTopic.getComments().length() > 50) {
                System.out.println("+++++Comments legnth:" + forumTopic.getComments().length());
                forumTopic.setComments(forumTopic.getComments().substring(1,50) + "...");
            }
        }
        return forumTopics;
    }

    public byte[] getTopicPicById(String id) {
        return forumTopicDao.getTopicPicById(id).getPic();
    }

    public ForumTopic getForumTopicById(String id) {
        return forumTopicDao.getForumTopicById(id);
    }
}
