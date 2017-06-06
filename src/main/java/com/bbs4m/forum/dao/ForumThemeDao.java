package com.bbs4m.forum.dao;

import com.bbs4m.forum.entities.ForumTheme;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Jason on 06/06/2017.
 */
@Component
public interface ForumThemeDao {
    List<ForumTheme> getForumThemeByPilot(int currentPageNumber, int num);
}
