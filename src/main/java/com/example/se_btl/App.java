package com.example.se_btl;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Rectangle2D;
import javafx.scene.Scene;
import javafx.stage.Screen;
import javafx.stage.Stage;

import java.io.*;
import java.sql.*;


public class App extends Application {
    @Override
    public void start(Stage stage) throws IOException {
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in, "UTF-8"));
        System.setOut(new PrintStream(new FileOutputStream(FileDescriptor.out),true,"UTF-8"));
        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("LoginUI.fxml"));
        Scene scene = new Scene(fxmlLoader.load(), 600, 400);
        //scene.getStylesheets().add("Config.css");
        //scene.getStylesheets().add(getClass().getResource("Config.css").toExternalForm());
        stage.setTitle("Quản lý trao thưởng - Dang nhap");
        stage.setScene(scene);
        stage.show();
        Rectangle2D bounds = Screen.getPrimary().getVisualBounds();
        double x = bounds.getMinX() + (bounds.getWidth() - scene.getWidth()) * 0.5;
        double y = bounds.getMinY() + (bounds.getHeight() - scene.getHeight()) * 0.5;
        stage.setX(x);
        stage.setY(y);
    }

    public static void main(String[] args) throws SQLException {
        launch();

    }
}