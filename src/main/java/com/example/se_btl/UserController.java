package com.example.se_btl;

import java.util.List;

public class UserController {
    public static String user;

    public static void setUser(String user) {
        UserController.user = user;
    }

    public static String getUser() {
        return user;
    }
}
