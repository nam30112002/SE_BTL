package com.example.se_btl.UI;

import com.example.se_btl.service.SQLConnection;
import javafx.scene.control.Button;
import javafx.scene.control.TableView;
import javafx.scene.input.MouseEvent;

import java.sql.SQLException;

public class TraoThuongUI {

    public Button lammoiBtn;
    public TableView danhsachTable;

    public void lamMoiDanhSach(MouseEvent mouseEvent) throws SQLException, ClassNotFoundException {
        String sql = "SELECT ID, danh_hieu, trang_thai from hoc_sinh";
        SQLConnection.getSqlConnection();
        SQLConnection.statement.executeQuery(sql);

    }
}
