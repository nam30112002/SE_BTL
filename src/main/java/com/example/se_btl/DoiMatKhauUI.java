package com.example.se_btl;

import com.example.se_btl.App;
import com.example.se_btl.UserController;
import com.example.se_btl.service.SQLConnection;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Rectangle2D;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.PasswordField;
import javafx.stage.Screen;
import javafx.stage.Stage;

import java.io.IOException;
import java.sql.*;
import java.util.Objects;

public class DoiMatKhauUI {
    @FXML
    private Button quayLaiButton;
    @FXML
    private Button xacNhanButton;
    @FXML
    private PasswordField matKhauCuField;
    @FXML
    private PasswordField matKhauMoiField;
    @FXML
    private PasswordField xacNhanMatKhauMoiField;


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

    public void xacNhanDoiMatKhau(ActionEvent event) throws SQLException {
        System.out.println("xac nhan doi MK");

        String matKhauCu = matKhauCuField.getText();
        String matKhauMoi = matKhauMoiField.getText();
        String xacNhanMatKhauMoi = xacNhanMatKhauMoiField.getText();
        String SQL = "select matkhau from taikhoan where taikhoan = '" + UserController.getUser() + "';";
        ResultSet resultSet = SQLConnection.statement.executeQuery(SQL);
        String matKhauDeCheck = null;
        while (resultSet.next()) {
            matKhauDeCheck = resultSet.getString(1);
        }
        //System.out.println(matKhauDeCheck);


        if (!Objects.equals(matKhauCu, matKhauDeCheck)) {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Đổi mật khẩu thất bại");
            alert.setContentText("Bạn đã nhập sai mật khẩu cũ");
            alert.showAndWait();
            return;
        }

        if (Objects.equals(matKhauCu, matKhauMoi)) {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Đổi mật khẩu thất bại");
            alert.setContentText("Mật khẩu mới trùng mật khẩu cũ");
            alert.showAndWait();
            return;
        }
        if (Objects.equals(matKhauCu, "") || Objects.equals(matKhauMoi, "") || Objects.equals(xacNhanMatKhauMoi, "")) {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Đổi mật khẩu thất bại");
            alert.setContentText("Chưa nhập đủ thông tin");
            alert.showAndWait();
            return;
        }
        if (!matKhauMoi.equals(xacNhanMatKhauMoi)) {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Đổi mật khẩu thất bại");
            alert.setContentText("Xác nhận mật khẩu không đúng");
            alert.showAndWait();
            return;
        }

        String SQL1 = "UPDATE taikhoan SET matkhau = '" + matKhauMoi + "' WHERE taikhoan = '" + UserController.getUser() + "';";
        System.out.println(SQL1);
        SQLConnection.statement.executeUpdate(SQL1);

        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Thông báo");
        alert.setHeaderText("Đổi mật khẩu thành công");
        alert.setContentText("Chúc mừng bạn đã đổi mật khẩu thành công");
        alert.showAndWait();

    }
}
