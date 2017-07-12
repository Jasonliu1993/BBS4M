package com.bbs4m.utilities;

/**
 * Created by Jason on 25/06/2017.
 */
public class DefaultValue {
    private static int DEF_THEME_ROW = 10;
    private static int DEF_CONTENT_ROW = 10;
    private static int DEF_TOPIC_ROW = 2;
    private static int DEF_SEARCH_ROW = 1;

    public static int getDefSearchRow() {
        return DEF_SEARCH_ROW;
    }

    public static int getDefThemeRow() {
        return DEF_THEME_ROW;
    }

    public static int getDefTopicRow() {
        return DEF_TOPIC_ROW;
    }

    public static int getDefContentRow() {
        return DEF_CONTENT_ROW;
    }
}
