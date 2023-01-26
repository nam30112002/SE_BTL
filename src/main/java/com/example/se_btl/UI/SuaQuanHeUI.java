package com.example.se_btl.UI;

import com.example.se_btl.entity.ThanhVienGiaDinh;
import com.example.se_btl.service.SQLConnection;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;

import java.sql.SQLException;
import java.util.Objects;

public class SuaQuanHeUI {
    @FXML
    private Button okB;
    @FXML
    private TextField quanHeTF;

    public void ok() throws SQLException {
        int id = ThanhVienGiaDinh.idNhanKhauTarget;
        String quanHe = quanHeTF.getText();
        if (Objects.equals(quanHe, "")) {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Thất bại");
            alert.setContentText("Nhập thiếu thông tin, vui lòng nhập lại");
            alert.showAndWait();
            return;
        }
        String sql = "UPDATE thanh_vien_cua_ho " +
                "SET quanHeVoiChuHo = N'" + quanHe + "'" +
                "WHERE idNhanKhau = " + id + ";" ;
        System.out.println(sql);
        SQLConnection.statement.executeUpdate(sql);
        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Thành công");
        alert.setHeaderText("Sửa thành công");
        alert.setContentText("Bấm RESET tại giao diện danh sách thành viên trong gia đình hộ khẩu để xem cập nhật mới nhất");
        alert.showAndWait();
    }
}
