package com.example.se_btl;

import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;

import java.sql.*;
import java.util.Objects;

public class LoginUI {
    @FXML
    private TextField tenDangNhapField;
    @FXML
    private PasswordField matKhauField;
    public void login(){
        ResultSet resultSet;
        try {
            String dbURL = "jdbc:sqlserver://localhost\\NAM30112002;database=user_of_QLNK;encrypt=false;user=nam;password=nam30112002";
            Connection conn = DriverManager.getConnection(dbURL);
            Statement statement = conn.createStatement();
            String SQL = "select * from taikhoan";
            resultSet = statement.executeQuery(SQL);
            int count=0;
            String inputTenDangNhap=tenDangNhapField.getText();
            String inputMatKhau=matKhauField.getText();

            while(resultSet.next()) {
                //System.out.println(resultSet.getString(1) + " | " + resultSet.getString(2));
                String tenDangNhap = resultSet.getString(1);
                String matKhau = resultSet.getString(2);

                if(Objects.equals(tenDangNhap, inputTenDangNhap)&& Objects.equals(inputMatKhau, matKhau)) {
                    access();
                    count++;
                    break;
                }
            }
            if(count==0){
                //System.out.println("dang nhap that bai");
                Alert alert = new Alert(Alert.AlertType.ERROR);
                alert.setTitle("Error");
                alert.setHeaderText("Dang nhap that bai");
                alert.setContentText("Tai khoan hoac mat khau khong ton tai");
                alert.showAndWait();
            }
        } catch (SQLException ex) {
            System.err.println("Cannot connect database, " + ex);
        }
    }

    public void setMatKhauField(PasswordField matKhauField) {
        this.matKhauField = matKhauField;
    }
    public void access(){
        System.out.println("dang nhap thanh cong");
        
    }
}
