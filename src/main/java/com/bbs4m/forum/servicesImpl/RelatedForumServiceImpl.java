package com.bbs4m.forum.servicesImpl;

import com.bbs4m.forum.dao.ForumThemeDao;
import com.bbs4m.forum.entities.ForumTheme;
import com.bbs4m.forum.services.RelatedForumService;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Jason on 28/06/2017.
 */
@Component
public class RelatedForumServiceImpl implements RelatedForumService{

    @Resource
    ForumThemeDao forumThemeDao;

    public List<ForumTheme> getRelatedForum(String themeId) {
        return forumThemeDao.getRelatedForumByThemeId(themeId);
    }
}
