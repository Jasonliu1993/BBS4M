package com.bbs4m.forum.services;

import com.bbs4m.forum.entities.ForumTheme;
import java.util.List;

/**
 * Created by Jason on 06/06/2017.
 */
public interface HomePageService {
    List<ForumTheme> getHomePageList(int currentPageNumber, int num);
}
