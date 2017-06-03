package com.bbs4m.utilities;

import java.io.File;

/**
 * Created by Jason on 5/14/17.
 */
public class HandleFile {
    public static File createFile(String path, String fileName) {
        File file = new File(path, fileName);
        if(!file.exists()){
            file.mkdirs();
        }
        return file;
    }

    public static boolean deleteFile(String fileName) {
        File file = new File(fileName);
        // 如果文件路径所对应的文件存在，并且是一个文件，则直接删除
        if (file.exists() && file.isFile()) {
            if (file.delete()) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }
}
