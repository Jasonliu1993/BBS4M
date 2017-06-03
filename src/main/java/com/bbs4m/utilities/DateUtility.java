package com.bbs4m.utilities;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Jason on 4/24/17.
 */
public class DateUtility {
    public static String getCurrentDate () {
        Date currentdate = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
        return simpleDateFormat.format(currentdate);
    }

    public static String DateUtility () {

    }

}