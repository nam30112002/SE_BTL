package com.example.se_btl.UI;

import com.example.se_btl.entity.HoKhau;
import com.example.se_btl.entity.ThanhVienGiaDinh;
import com.example.se_btl.service.SQLConnection;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;

import java.sql.SQLException;
import java.util.Objects;

public class ChinhSuaDiaChiHoKhauUI {
    @FXML
    private TextField diaChiTF;
    @FXML
    private Button okB;

    public void ok() throws SQLException {
        String maHoKhau = HoKhau.maHoKhauTarget;
        String diaChi = diaChiTF.getText();
        if (Objects.equals(diaChi, "")) {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Thất bại");
            alert.setContentText("Nhập thiếu thông tin, vui lòng nhập lại");
            alert.showAndWait();
            return;
        }
        String sql = "UPDATE ho_khau " +
                "SET diaChi = N'" + diaChi + "'" +
                "WHERE maHoKhau = N'" + maHoKhau + "';" ;
        System.out.println(sql);
        SQLConnection.statement.executeUpdate(sql);
        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Thành công");
        alert.setHeaderText("Sửa thành công");
        alert.setContentText("Bấm RESET tại giao diện hộ khẩu để xem cập nhật mới nhất");
        alert.showAndWait();
    }
}
