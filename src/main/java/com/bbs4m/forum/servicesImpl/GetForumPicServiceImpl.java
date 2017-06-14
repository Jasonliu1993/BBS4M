package com.bbs4m.forum.servicesImpl;

import com.bbs4m.forum.dao.ForumPicDao;
import com.bbs4m.forum.services.GetForumPicService;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * Created by Jason on 13/06/2017.
 */
@Component
public class GetForumPicServiceImpl implements GetForumPicService{
    @Resource
    ForumPicDao forumPicDao;

    public byte[] getForumPicById(String id) {
        return forumPicDao.getForumPicByid(id).getPic();
    }
}
