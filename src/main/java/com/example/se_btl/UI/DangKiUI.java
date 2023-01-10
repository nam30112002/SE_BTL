package com.example.se_btl.UI;

import com.example.se_btl.App;
import com.example.se_btl.service.SQLConnection;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Rectangle2D;
import javafx.scene.Node;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Screen;
import javafx.stage.Stage;

import java.io.IOException;
import java.sql.*;
import java.util.Objects;

public class DangKiUI {
    @FXML
    private AnchorPane dangKiUI;
    @FXML
    private Button quayLai;
    @FXML
    private ChoiceBox<String> chonQuyen;
    @FXML
    private TextField tenDangNhapDK;
    @FXML
    private PasswordField matKhauDK;
    @FXML
    private PasswordField xacNhanMatKhauDK;



    public void quayLaiLoginUI(ActionEvent event) throws IOException {
        System.out.println("quay lai thanh cong");
        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("LoginUI.fxml"));
        Scene scene = new Scene(fxmlLoader.load());
        Stage stage = (Stage) quayLai.getScene().getWindow(); //lay stage chua LoginUI
        stage.setTitle("Quản lý trao thưởng - Đăng nhập");
        stage.setScene(scene);
        stage.show();
        Rectangle2D bounds = Screen.getPrimary().getVisualBounds();
        double x = bounds.getMinX() + (bounds.getWidth() - scene.getWidth()) * 0.5;
        double y = bounds.getMinY() + (bounds.getHeight() - scene.getHeight()) * 0.5;
        stage.setX(x);
        stage.setY(y);
    }

    public void checkDangKi() throws SQLException {
        System.out.println("da an dang ki");
        String tenDangNhap = tenDangNhapDK.getText();
        String matKhau = matKhauDK.getText();
        String xacNhanMatKhau = xacNhanMatKhauDK.getText();
        if (!Objects.equals(xacNhanMatKhau, matKhau)) {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Đăng kí thất bại");
            alert.setContentText("Xác nhận mật khẩu chưa đúng, vui lòng nhập lại");
            alert.showAndWait();
            return;
        }
        if (Objects.equals(matKhau, "") || Objects.equals(tenDangNhap, "")) {
            System.out.println("thieuthongtin");
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Đăng kí thất bại");
            alert.setContentText("Chưa nhập đủ thông tin, vui lòng nhập lại");
            alert.showAndWait();
            return;
        }

        String SQL = "select * from users";
        ResultSet resultSet = SQLConnection.statement.executeQuery(SQL);
        int count = 0;
        while (resultSet.next()) {
            //System.out.println(resultSet.getString(1) + " | " + resultSet.getString(2));
            String tenDangNhapDeCheck = resultSet.getString(2);
            if (Objects.equals(tenDangNhap, tenDangNhapDeCheck)) {
                Alert alert = new Alert(Alert.AlertType.ERROR);
                alert.setTitle("Error");
                alert.setHeaderText("Đăng kí thất bại");
                alert.setContentText("Tên đăng nhập đã tồn tại, vui lòng chọn tên khác");
                alert.showAndWait();
                count++;
                break;
            }
        }
        if (count > 0) return;

        String SQL1 = "insert into users(userName, passwd) values ('" + tenDangNhap + "','" + matKhau +"');";
        System.out.println("Đăng kí thành công");
        SQLConnection.statement.executeUpdate(SQL1);
        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Thông báo");
        alert.setHeaderText("Đăng kí thành công");
        alert.setContentText("Chúc mừng bạn đã đăng kí thành công, vui lòng đăng nhập lại để sử dụng");
        alert.showAndWait();

    }
}
