package com.example.se_btl;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;

import java.util.List;

public class UserController {

    private static String user;
    public static int count;
    static {
        count = 0;
    }

    public static void setUser(String user) {
        UserController.user = user;
    }

    public static String getUser() {
        return user;
    }
}
