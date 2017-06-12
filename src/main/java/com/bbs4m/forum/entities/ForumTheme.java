package com.bbs4m.forum.entities;


import java.util.List;

public class ForumTheme {

    private String id;
    private long version;
    private String themeContent;
    private String creater;
    private String createTime;
    private long browse;
    private String custom1;
    private String custom2;
    private String custom3;
    private String custom4;
    private String custom5;
    private List<TopicInclude> topicIncludes;
    private List<FollowTheme> followThemes;
    private ForumContent FirstForumContent;
    private String differentTime;
    private String replyCount;
    private ForumContent lastReplyContent;
    private UserAttribute createrUserAttribute;

    public ForumContent getLastReplyContent() {
        return lastReplyContent;
    }

    public void setLastReplyContent(ForumContent lastReplyContent) {
        this.lastReplyContent = lastReplyContent;
    }

    public List<TopicInclude> getTopicIncludes() {
        return topicIncludes;
    }

    public void setTopicIncludes(List<TopicInclude> topicIncludes) {
        this.topicIncludes = topicIncludes;
    }

    public List<FollowTheme> getFollowThemes() {
        return followThemes;
    }

    public void setFollowThemes(List<FollowTheme> followThemes) {
        this.followThemes = followThemes;
    }

    public ForumContent getFirstForumContent() {
        return FirstForumContent;
    }

    public void setFirstForumContent(ForumContent firstForumContent) {
        FirstForumContent = firstForumContent;
    }

    public String getDifferentTime() {
        return differentTime;
    }

    public void setDifferentTime(String differentTime) {
        this.differentTime = differentTime;
    }

    public String getReplyCount() {
        return replyCount;
    }

    public void setReplyCount(String replyCount) {
        this.replyCount = replyCount;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }


    public long getVersion() {
        return version;
    }

    public void setVersion(long version) {
        this.version = version;
    }


    public String getThemeContent() {
        return themeContent;
    }

    public void setThemeContent(String themeContent) {
        this.themeContent = themeContent;
    }


    public String getCreater() {
        return creater;
    }

    public void setCreater(String creater) {
        this.creater = creater;
    }


    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }


    public long getBrowse() {
        return browse;
    }

    public void setBrowse(long browse) {
        this.browse = browse;
    }


    public String getCustom1() {
        return custom1;
    }

    public void setCustom1(String custom1) {
        this.custom1 = custom1;
    }


    public String getCustom2() {
        return custom2;
    }

    public void setCustom2(String custom2) {
        this.custom2 = custom2;
    }


    public String getCustom3() {
        return custom3;
    }

    public void setCustom3(String custom3) {
        this.custom3 = custom3;
    }


    public String getCustom4() {
        return custom4;
    }

    public void setCustom4(String custom4) {
        this.custom4 = custom4;
    }


    public String getCustom5() {
        return custom5;
    }

    public void setCustom5(String custom5) {
        this.custom5 = custom5;
    }

    public UserAttribute getCreaterUserAttribute() {
        return createrUserAttribute;
    }

    public void setCreaterUserAttribute(UserAttribute createrUserAttribute) {
        this.createrUserAttribute = createrUserAttribute;
    }
}
