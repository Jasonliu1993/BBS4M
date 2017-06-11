package com.bbs4m.utilities;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Jason on 4/24/17.
 */
public class DateUtility {

    private static SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public static String getCurrentDate () {
        Date currentdate = new Date();
        return simpleDateFormat.format(currentdate);
    }

    public static String getTimeQuantum (String endDateStr,String startDateStr) {
        try {
            Date endDate = simpleDateFormat.parse(endDateStr);
            Date startDate = simpleDateFormat.parse(startDateStr);
            double different = (double)((endDate.getTime() - startDate.getTime()) / 1000);
            if ((different / 60) > 1) {
                if ((different / 60 / 60) > 1) {
                    if ((different / 60 / 60 / 24) > 1) {
                        if ((different / 60 / 60 / 24 / 30) > 1) {
                            if ((different / 60 / 60 / 24 / 30 / 12) > 1) {
                                return (int)Math.floor(different / 60 / 60 / 24 / 30 / 12) + "年前";
                            } else {
                                return (int)Math.floor(different / 60 / 60 / 24 / 30) + "月前";
                            }
                        } else {
                            return (int)Math.floor(different / 60 / 60 / 24) + "天前";
                        }
                    } else {
                        return (int)Math.floor(different / 60 / 60) + "小时前";
                    }
                } else {
                    return (int)Math.floor(different / 60) + "分钟前";
                }
            } else {
                return (int)different + "秒前";
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }
}