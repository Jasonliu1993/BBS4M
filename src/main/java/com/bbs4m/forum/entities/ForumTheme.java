package com.bbs4m.forum.entities;


import java.util.List;

public class ForumTheme {

    private String id;
    private long version;
    private long themeContent;
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
    private List<ForumContent> forumContents;
    private String differentTime;
    private String replyCount;
    private PersonalAvator personalAvator;

    public PersonalAvator getPersonalAvator() {
        return personalAvator;
    }

    public void setPersonalAvator(PersonalAvator personalAvator) {
        this.personalAvator = personalAvator;
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

    public List<ForumContent> getForumContents() {
        return forumContents;
    }

    public void setForumContents(List<ForumContent> forumContents) {
        this.forumContents = forumContents;
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


    public long getThemeContent() {
        return themeContent;
    }

    public void setThemeContent(long themeContent) {
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

}
