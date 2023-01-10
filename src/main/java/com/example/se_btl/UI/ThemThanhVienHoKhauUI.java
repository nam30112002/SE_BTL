package com.example.se_btl.UI;

import com.example.se_btl.UserController;
import com.example.se_btl.entity.HoKhau;
import com.example.se_btl.entity.ThanhVienGiaDinh;
import com.example.se_btl.service.SQLConnection;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Objects;

public class ThemThanhVienHoKhauUI {
    @FXML
    private TextField quanHeTF;
    @FXML
    private TextField cccdTF;
    @FXML
    private Button checkB;
    @FXML
    private Button themB;
    @FXML
    private TextField tenTF;
    public void check() throws SQLException {
        String cccd = cccdTF.getText();
        String sql1 = "select count(ID) from nhan_khau where CCCD = N'" + cccd + "';";
        ResultSet resultSet1 = SQLConnection.statement.executeQuery(sql1);
        if (resultSet1.next()){
            System.out.println(resultSet1.getInt(1));
            if(resultSet1.getInt(1)==0){
                Alert alert = new Alert(Alert.AlertType.ERROR);
                alert.setTitle("Error");
                alert.setHeaderText("Kiểm tra thất bại");
                alert.setContentText("CCCD không tồn tại trong danh sách nhân khẩu");
                alert.showAndWait();
                return;
            }
        }

        String sql2 = "select count(idNhanKhau) from thanh_vien_cua_ho, nhan_khau where thanh_vien_cua_ho.idNhanKhau = nhan_khau.ID" +
                " and nhan_khau.CCCD = N'" + cccd +"';";
        ResultSet resultSet2 = SQLConnection.statement.executeQuery(sql2);
        if(resultSet2.next()){
            int count = resultSet2.getInt(1);
            if(count>0){
                Alert alert = new Alert(Alert.AlertType.ERROR);
                alert.setTitle("Error");
                alert.setHeaderText("Kiểm tra thất bại");
                alert.setContentText("Người này đã có trong hộ khẩu khác");
                alert.showAndWait();
                return;
            }
        }
        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Thành công");
        alert.setHeaderText("Check thành công");
        alert.showAndWait();
        String sql3 = "select * from nhan_khau where CCCD = N'" + cccd + "';";
        ResultSet resultSet3 = SQLConnection.statement.executeQuery(sql3);
        String ten = null;
        if(resultSet3.next()){
            ten = resultSet3.getString("hoTen");
        }
        tenTF.setText(ten);
        UserController.count = 1;
    }
    public void them() throws SQLException {
        int idNhanKhau = 0;
        int idHoKhau = 0;
        if(UserController.count != 1){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Thêm thất bại");
            alert.setContentText("Bạn chưa check CCCD của người được thêm");
            alert.showAndWait();
            return;
        }


        String sql3 = "select * from nhan_khau where CCCD = N'" + cccdTF.getText() + "';";
        ResultSet resultSet3 = SQLConnection.statement.executeQuery(sql3);

        if(resultSet3.next()){
            idNhanKhau = resultSet3.getInt("ID");
        }


        String sql4 = "select * from ho_khau where maHoKhau = N'" + ThanhVienGiaDinh.maHoKhauTarget + "';";
        ResultSet resultSet4 = SQLConnection.statement.executeQuery(sql4);
        if(resultSet4.next()){
            idHoKhau = resultSet4.getInt("ID");
        }

        String quanHe = quanHeTF.getText();
        System.out.println(1);
        if(quanHe.length()==0){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Thêm thất bại");
            alert.setContentText("Bạn chưa nhập quan hệ với chủ hộ của người được thêm");
            alert.showAndWait();
            return;
        }
        if(idNhanKhau!=0 &&idHoKhau!=0) {
            String sql = "insert into thanh_vien_cua_ho(idNhanKhau, idHoKhau, quanHeVoiChuHo) values ("
                    + idNhanKhau + "," + idHoKhau + ",N'" + quanHe + "');";
            SQLConnection.statement.executeUpdate(sql);
            cccdTF.setText("");
            quanHeTF.setText("");
            Alert alert = new Alert(Alert.AlertType.INFORMATION);
            alert.setTitle("Thành công");
            alert.setHeaderText("Thêm thành công");
            alert.setContentText("Bấm RESET tại giao diện danh sách thành viên trong gia đình hộ khẩu để xem cập nhật mới nhất");
            alert.showAndWait();
            return;
        }
        UserController.count = 0;
    }
}
