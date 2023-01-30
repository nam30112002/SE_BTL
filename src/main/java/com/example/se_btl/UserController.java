package com.example.se_btl;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;

import java.util.List;

public class UserController {

    private static String user;
    public static int count;
    public static int count1;
    static {
        count1 = 0;
        count = 0;
    }



    public static void setUser(String user) {
        UserController.user = user;
    }

    public static String getUser() {
        return user;
    }
}
