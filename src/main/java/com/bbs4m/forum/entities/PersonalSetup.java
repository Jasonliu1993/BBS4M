package com.bbs4m.forum.entities;

/**
 * Created by Jason on 06/06/2017.
 */
public class PersonalSetup {

    private String id;
    private long version;
    private String userid;
    private long listCountInPage;
    private String custom1;
    private String custom2;
    private String custom3;
    private String custom4;
    private String custom5;


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


    public long getListCountInPage() {
        return listCountInPage;
    }

    public void setListCountInPage(long listCountInPage) {
        this.listCountInPage = listCountInPage;
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
