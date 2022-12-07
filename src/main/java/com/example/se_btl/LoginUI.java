package com.example.se_btl;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Rectangle2D;
import javafx.scene.Node;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Screen;
import javafx.stage.Stage;
import javafx.scene.control.Alert;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;

import java.io.IOException;
import java.sql.*;
import java.util.Objects;

public class LoginUI {
    @FXML
    private TextField tenDangNhapField;
    @FXML
    private PasswordField matKhauField;

    public void login(ActionEvent event) {
        ResultSet resultSet;
        try {
            String dbURL = "jdbc:sqlserver://localhost\\NAM30112002;database=user_of_QLNK;encrypt=false;user=nam;password=nam30112002";
            Connection conn = DriverManager.getConnection(dbURL);
            Statement statement = conn.createStatement();
            String SQL = "select * from taikhoan";
            resultSet = statement.executeQuery(SQL);
            int count = 0;
            String inputTenDangNhap = tenDangNhapField.getText();
            String inputMatKhau = matKhauField.getText();
            if (Objects.equals(inputMatKhau, "") || Objects.equals(inputTenDangNhap, "")) {
                Alert alert = new Alert(Alert.AlertType.ERROR);
                alert.setTitle("Error");
                alert.setHeaderText("Đăng nhập thất bại");
                alert.setContentText("Nhập thiếu thông tin, vui lòng nhập lại");
                alert.showAndWait();
                return;
            }

            while (resultSet.next()) {
                //System.out.println(resultSet.getString(1) + " | " + resultSet.getString(2));
                String tenDangNhap = resultSet.getString(1);
                String matKhau = resultSet.getString(2);

                if (Objects.equals(tenDangNhap, inputTenDangNhap) && Objects.equals(inputMatKhau, matKhau)) {
                    try {
                        UserController.setUser(tenDangNhap);
                        access(event);
                    } catch (IOException e) {
                        System.out.println(e);
                    }
                    count++;
                    break;
                }
            }
            if (count == 0) {
                //System.out.println("dang nhap that bai");
                Alert alert = new Alert(Alert.AlertType.ERROR);
                alert.setTitle("Error");
                alert.setHeaderText("Đăng nhập thất bại");
                alert.setContentText("Tài khoản hoặc mật khẩu không đúng");
                alert.showAndWait();
            }
            statement.close();
        } catch (SQLException ex) {
            System.err.println("Cannot connect database, " + ex);
        }
    }


    public void access(ActionEvent event) throws IOException {
        System.out.println("dang nhap thanh cong");

        FXMLLoader fxmlLoader1 = new FXMLLoader(App.class.getResource("MainUI.fxml"));
        Scene scene1 = new Scene(fxmlLoader1.load());
        Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow(); //lay stage chua LoginUI
        stage.setTitle("Quản lý trao thưởng - Trang chủ");
        stage.setScene(scene1);
        stage.show();
        Rectangle2D bounds = Screen.getPrimary().getVisualBounds();
        double x = bounds.getMinX() + (bounds.getWidth() - scene1.getWidth()) * 0.5;
        double y = bounds.getMinY() + (bounds.getHeight() - scene1.getHeight()) * 0.5;
        stage.setX(x);
        stage.setY(y);
    }

    public void chuyenDangKiUI(ActionEvent event) throws IOException {
        System.out.println("chuyen dang ki thanh cong");
        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("DangKiUI.fxml"));

        Scene scene = new Scene(fxmlLoader.load());
        Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow(); //lay stage chua LoginUI
        stage.setTitle("Quản lý trao thưởng - Đăng kí");
        stage.setScene(scene);
        stage.show();
        Rectangle2D bounds = Screen.getPrimary().getVisualBounds();
        double x = bounds.getMinX() + (bounds.getWidth() - scene.getWidth()) * 0.5;
        double y = bounds.getMinY() + (bounds.getHeight() - scene.getHeight()) * 0.5;
        stage.setX(x);
        stage.setY(y);
    }
}
