package com.example.se_btl;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Rectangle2D;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.stage.Screen;
import javafx.stage.Stage;

import java.io.IOException;

public class DoiMatKhauUI {
    @FXML
    private Button quayLaiButton;
    public void quayLaiMainUI(ActionEvent event) throws IOException {
        System.out.println("quay lai mainUI");
        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("MainUI.fxml"));
        Scene scene = new Scene(fxmlLoader.load());

        //Stage stage = (Stage)( (Node) event.getSource() ).getScene().getWindow(); //lay stage chua LoginUI
        //Stage stage = (Stage)dangXuat.getParentPopup().getOwnerWindow(); //menuitem khong phai la lop con cua Node
        Stage stage = (Stage) quayLaiButton.getScene().getWindow();//tranh loi NUllPointer
        stage.setTitle("Quản lý trao thưởng - Trang chủ");
        stage.setScene(scene);
        stage.show();
        Rectangle2D bounds = Screen.getPrimary().getVisualBounds();
        double x = bounds.getMinX() + (bounds.getWidth() - scene.getWidth()) * 0.5;
        double y = bounds.getMinY() + (bounds.getHeight() - scene.getHeight()) * 0.5;
        stage.setX(x);
        stage.setY(y);
    }
}
