package com.bbs4m.forum.entities;


public class ForumTopic {

  private String id;
  private long version;
  private String topicName;
  private String comments;
  private byte[] pic;
  private String creater;
  private String createTime;
  private String custom1;
  private String custom2;
  private String custom3;
  private String custom4;
  private String custom5;

  private int relatedForumCount;


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

  public String getComments() {
    return comments;
  }

  public void setComments(String comments) {
    this.comments = comments;
  }

    public byte[] getPic() {
        return pic;
    }

    public void setPic(byte[] pic) {
        this.pic = pic;
    }

    public String getTopicName() {
    return topicName;
  }

  public void setTopicName(String topicName) {
    this.topicName = topicName;
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

    public int getRelatedForumCount() {
        return relatedForumCount;
    }

    public void setRelatedForumCount(int relatedForumCount) {
        this.relatedForumCount = relatedForumCount;
    }
}
