package com.bbs4m.forum.entities;


public class ForumContent {

    private String id;
    private long version;
    private long orderNumber;
    private String themeRefId;
    private String content;
    private String picFlag;
    private String picId;
    private long likeCount;
    private long dislikeCount;
    private String anonymitye;
    private String creater;
    private String userName;
    private String createTime;
    private String custom1;
    private String custom2;
    private String custom3;
    private String custom4;
    private String custom5;
    private String replyCount;
    private ForumTheme forumTheme;
    private String themeContent;
    private String differentTime;

    public String getDifferentTime() {
        return differentTime;
    }

    public void setDifferentTime(String differentTime) {
        this.differentTime = differentTime;
    }

    public String getThemeContent() {
        return themeContent;
    }

    public void setThemeContent(String themeContent) {
        this.themeContent = themeContent;
    }

    public ForumTheme getForumTheme() {
        return forumTheme;
    }

    public void setForumTheme(ForumTheme forumTheme) {
        this.forumTheme = forumTheme;
    }

    public String getReplyCount() {
        return replyCount;
    }

    public void setReplyCount(String replyCount) {
        this.replyCount = replyCount;
    }

    public long getLikeCount() {
        return likeCount;
    }

    public void setLikeCount(long likeCount) {
        this.likeCount = likeCount;
    }

    public long getDislikeCount() {
        return dislikeCount;
    }

    public void setDislikeCount(long dislikeCount) {
        this.dislikeCount = dislikeCount;
    }

    public String getPicFlag() {
        return picFlag;
    }

    public void setPicFlag(String picFlag) {
        this.picFlag = picFlag;
    }

    public String getPicId() {
        return picId;
    }

    public void setPicId(String picId) {
        this.picId = picId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
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


    public long getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(long orderNumber) {
        this.orderNumber = orderNumber;
    }


    public String getThemeRefId() {
        return themeRefId;
    }

    public void setThemeRefId(String themeRefId) {
        this.themeRefId = themeRefId;
    }


    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }


    public String getCreater() {
        return creater;
    }

    public void setCreater(String creater) {
        this.creater = creater;
    }

    public String getAnonymitye() {
        return anonymitye;
    }

    public void setAnonymitye(String anonymitye) {
        this.anonymitye = anonymitye;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
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
