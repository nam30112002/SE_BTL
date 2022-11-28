package com.example.se_btl;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Rectangle2D;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Menu;
import javafx.scene.control.MenuBar;
import javafx.scene.control.MenuItem;
import javafx.scene.layout.BorderPane;
import javafx.stage.Screen;
import javafx.stage.Stage;
import javafx.stage.Window;

import java.io.IOException;

public class MainUI {
    public MenuItem doiMatKhauMenuItem;
    @FXML
    private MenuItem dangXuat;
    @FXML
    private MenuBar mainMenuBar;


    public void logOut(ActionEvent event) throws IOException {
        System.out.println("da log out");
        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("LoginUI.fxml"));
        Scene scene = new Scene(fxmlLoader.load());

        //Stage stage = (Stage)( (Node) event.getSource() ).getScene().getWindow(); //lay stage chua LoginUI
        //Stage stage = (Stage)dangXuat.getParentPopup().getOwnerWindow(); //menuitem khong phai la lop con cua Node
        Stage stage = (Stage) mainMenuBar.getScene().getWindow();//tranh loi NUllPointer
        stage.setTitle("Quản lý trao thưởng - Đăng nhập");
        stage.setScene(scene);
        stage.show();
        Rectangle2D bounds = Screen.getPrimary().getVisualBounds();
        double x = bounds.getMinX() + (bounds.getWidth() - scene.getWidth()) * 0.5;
        double y = bounds.getMinY() + (bounds.getHeight() - scene.getHeight()) * 0.5;
        stage.setX(x);
        stage.setY(y);
    }

    public void chuyenDoiMatKhauUI(ActionEvent event) throws IOException {
        System.out.println("chuyen doi mat khau");
        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("DoiMatKhauUI.fxml"));
        Scene scene = new Scene(fxmlLoader.load());
        //Stage stage = (Stage)( (Node) event.getSource() ).getScene().getWindow(); //lay stage chua LoginUI
        //Stage stage = (Stage)dangXuat.getParentPopup().getOwnerWindow(); //menuitem khong phai la lop con cua Node
        Stage stage = (Stage) mainMenuBar.getScene().getWindow();//tranh loi NUllPointer
        stage.setTitle("Quản lý trao thưởng - Đổi mật khẩu");
        stage.setScene(scene);
        stage.show();
        Rectangle2D bounds = Screen.getPrimary().getVisualBounds();
        double x = bounds.getMinX() + (bounds.getWidth() - scene.getWidth()) * 0.5;
        double y = bounds.getMinY() + (bounds.getHeight() - scene.getHeight()) * 0.5;
        stage.setX(x);
        stage.setY(y);
    }

}
