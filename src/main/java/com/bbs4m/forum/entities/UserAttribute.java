package com.bbs4m.forum.entities;

import java.util.List;

/**
 * Created by Jason on 12/06/2017.
 */
public class UserAttribute {

    private String id;
    private long version;
    private String userid;
    private String userName;
    private long userScore;
    private String custom1;
    private String custom2;
    private String custom3;
    private String custom4;
    private String custom5;
    private List<FollowUser> followUsers;
    private String sendForum;
    private String replyForum;

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


    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }


    public long getUserScore() {
        return userScore;
    }

    public void setUserScore(long userScore) {
        this.userScore = userScore;
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

    public List<FollowUser> getFollowUsers() {
        return followUsers;
    }

    public void setFollowUsers(List<FollowUser> followUsers) {
        this.followUsers = followUsers;
    }

    public String getSendForum() {
        return sendForum;
    }

    public void setSendForum(String sendForum) {
        this.sendForum = sendForum;
    }

    public String getReplyForum() {
        return replyForum;
    }

    public void setReplyForum(String replyForum) {
        this.replyForum = replyForum;
    }
}
