package com.example.se_btl.UI;

import com.example.se_btl.entity.HoKhau;
import com.example.se_btl.entity.ThanhVienGiaDinh;
import com.example.se_btl.service.SQLConnection;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Objects;

public class ChinhSuaDiaChiHoKhauUI {
    @FXML
    private TextField diaChiTF;
    @FXML
    private Button okB;

    public void ok() throws SQLException {
        java.util.Date thoigian=new Date();
        String maHoKhau = HoKhau.maHoKhauTarget;
        String diaChi = diaChiTF.getText();
        String sql1 = "select * from ho_khau where maHoKhau = N'" + maHoKhau + "';";
        ResultSet resultSet = SQLConnection.statement.executeQuery(sql1);

        int idChuHo = 0;
        if(resultSet.next()){
            idChuHo = resultSet.getInt("idChuHo");
        }
        String sql2 = "SELECT * FROM nhan_khau WHERE ID = " + idChuHo + ";";
        ResultSet resultSet1 = SQLConnection.statement.executeQuery(sql2);
        String hoTen=null;
        while (resultSet1.next()){
            hoTen = resultSet1.getString("hoTen");
        }
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
        String sql5= "insert into lich_su(thoigian,noidung)" + "values(N'" + String.format("%s",thoigian.toString())+ "',N'" + String.format("Thay đổi địa chỉ hộ khẩu của chủ hộ: %s", hoTen) + "');";
        SQLConnection.statement.executeUpdate(sql5);

        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Thành công");
        alert.setHeaderText("Sửa thành công");
        alert.setContentText("Bấm RESET tại giao diện hộ khẩu để xem cập nhật mới nhất");
        alert.showAndWait();
    }
}
