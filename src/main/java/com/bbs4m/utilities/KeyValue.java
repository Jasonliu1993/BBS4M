package com.bbs4m.utilities;

import java.util.Random;

/**
 * Created by Jason on 4/24/17.
 */
public class KeyValue {
    public static String getKeyValue(){
        String code = "123456789qwertyuipasdfghjklzxcvbnmQWERTYUIPASDGFHJKLZXCVBNM";
        StringBuffer keyCode = new StringBuffer("");
        for (int i = 0; i <= 10; i++){
            char tempChar = code.charAt((int)(new Random().nextInt(58)));
            keyCode.append(tempChar);
        }
        return keyCode.toString();
    }
}