package com.bbs4m.utilities;

/**
 * Created by Jason on 5/1/17.
 */
public class EscapeWord {
    public static String getEscaping(String input) {
        String output = null;
        output = input.replace("<","&lt;").replace("{[","<strong>").replace("]}","</strong>").replace("{","<").replace("}",">");
        return output;
    }
}
